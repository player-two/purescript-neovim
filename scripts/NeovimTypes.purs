module NeovimTypes where

import Prelude
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (log, CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION)
import Control.Monad.Except (runExcept)
import Data.Array (filter, snoc, uncons)
import Data.Either (either)
import Data.Foldable (foldl, sequence_)
import Data.Foreign.Class (readJSON)
import Data.Maybe (maybe, maybe', Maybe(Just, Nothing))
import Data.StrMap (alter, empty, fold, keys, lookup, StrMap)
import Data.String as Str
import Data.Tuple (fst, snd, Tuple(..))
import Node.Buffer (toString, BUFFER)
import Node.ChildProcess (exec, ExecResult, CHILD_PROCESS)
import Node.Encoding (Encoding(UTF8))
import Node.FS (FS)
import Node.FS.Sync (writeTextFile)

import ApiInfo (ApiInfo(..), Func(..), Type(..))
import DefinePurs as DefinePurs
import DefineJs as DefineJs


main :: forall e. Eff (buffer :: BUFFER, cp :: CHILD_PROCESS, console :: CONSOLE, err :: EXCEPTION, fs :: FS | e) Unit
main = exec "nvim --api-info | msgpack2json" handle

handle :: forall e. ExecResult -> Eff (buffer :: BUFFER, cp :: CHILD_PROCESS, console :: CONSOLE, err :: EXCEPTION, fs :: FS | e) Unit
handle { stderr: err, stdout: out, error: Nothing } = toString UTF8 out >>= (either err buildInterface <<< runExcept <<< readJSON)
  where err = log <<< show
handle { error: Just e } = (log <<< show) e

groupByMap :: forall a b. (a -> Tuple String b) -> (Array a) -> StrMap (Array b)
groupByMap fn = foldl (\d x -> let res = fn x in alter (append (snd res)) (fst res) d) empty
  where append x = Just <<< maybe' (\_ -> [x]) (flip snoc x)

foldUntil :: forall a b. (Unit -> b) -> (String -> a -> Maybe b) -> (StrMap a) -> b
foldUntil default f dict = maybe' default id (recur (keys dict))
  where recur ks = uncons ks >>= (\{ head: k, tail: ks } -> maybe' (\_ -> recur ks) Just (lookup k dict >>= f k))

getModule :: StrMap Type -> Func -> Tuple String Func
getModule types (Func f) = foldUntil default (\n (Type t) -> (Tuple n <<< changeName f) <$> Str.stripPrefix (Str.Pattern t.prefix) f.name) types
  where changeName f name = Func (f { name = name })
        default _ = Tuple "Nvim" $ maybe (Func f) (changeName f) (Str.stripPrefix (Str.Pattern "nvim_") f.name)

splitByModule :: ApiInfo -> StrMap (Array Func)
splitByModule (ApiInfo api) = groupByMap (getModule api.types) (filter nonDeprecated api.functions)
  where nonDeprecated = Str.contains (Str.Pattern "nvim_") <<< (\(Func f) -> f.name)

writeTextFile' = writeTextFile UTF8

buildInterface :: forall e. ApiInfo -> Eff (err :: EXCEPTION, fs :: FS | e) Unit
buildInterface api = sequence_ $ fold (\arr k v -> snoc arr (defineModule k v)) [types] modules
  where modules = splitByModule api
        types = writeTextFile' ("./src/Neovim/Types.purs") $ foldl (<>) "module Neovim.Types where\n\n" (map DefinePurs.defImport (keys modules))

defineModule :: forall e. String -> (Array Func) -> Eff (err :: EXCEPTION, fs :: FS | e) Unit
defineModule m fs = sequence_ <<< map (\fn -> fn fs) $ effs
  where effs = [ writeTextFile' ("./src/Neovim/" <> m <> ".purs") <<< foldl (\s f -> s <> DefinePurs.defFunc f) header
               , writeTextFile' ("./src/Neovim/" <> m <> ".js") <<< foldl (\s f -> s <> DefinePurs.defForeignFunc f) DefineJs.header
               ]
        header = "module Neovim." <> m <> "\n" <> DefinePurs.exports fs <> " where\n" <> DefinePurs.imports <> "\n"
