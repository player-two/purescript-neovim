module NeovimTypes where

import Prelude
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (log, CONSOLE)
import Control.Monad.Eff.Exception (error, EXCEPTION)
import Control.Monad.Except (runExcept, throwError)
import Data.Array (cons, drop, filter, snoc, uncons)
import Data.Either (either, Either(Left, Right))
import Data.Foldable (foldl, sequence_)
import Data.Foreign (unsafeFromForeign, unsafeReadTagged, Foreign, F)
import Data.Foreign.Class (readJSON, readProp, class IsForeign)
import Data.Maybe (maybe, maybe', Maybe(Just, Nothing))
import Data.StrMap (alter, empty, fold, fromFoldable, insert, keys, lookup, StrMap)
import Data.String as Str
import Data.String.Regex (match, regex, test, Regex)
import Data.String.Regex.Flags (noFlags)
import Data.Tuple (fst, snd, Tuple(..))
import Node.Buffer (toString, BUFFER)
import Node.ChildProcess (exec, ExecResult, CHILD_PROCESS)
import Node.Encoding (Encoding(UTF8))
import Node.FS (FS)
import Node.FS.Sync (writeTextFile)

import DefineJs as DefineJs


main :: forall e. Eff (buffer :: BUFFER, cp :: CHILD_PROCESS, console :: CONSOLE, err :: EXCEPTION, fs :: FS | e) Unit
main = exec "nvim --api-info | msgpack2json" handle

handle :: forall e. ExecResult -> Eff (buffer :: BUFFER, cp :: CHILD_PROCESS, console :: CONSOLE, err :: EXCEPTION, fs :: FS | e) Unit
handle { stderr: err, stdout: out, error: Nothing } = toString UTF8 out >>= (either err buildInterface <<< runExcept <<< readJSON)
  where err = log <<< show
handle { error: Just e } = (log <<< show) e

data ApiInfo = ApiInfo
  { functions :: Array Func
  , types :: StrMap Type
  --, errorTypes:
  }

instance apiInfoIsForeign :: IsForeign ApiInfo where
  read value = do
    fs <- readProp "functions" value
    ts <- readProp "types" value

    -- TODO: figure out generic way
    buf <- readProp "Buffer" ts
    win <- readProp "Window" ts
    tab <- readProp "Tabpage" ts

    pure $ ApiInfo { functions: fs, types: fromFoldable [ Tuple "Buffer" buf, Tuple "Window" win, Tuple "Tabpage" tab ] }

data Func = Func
  { name :: String
  , parameters :: Array Parameter
  , returnType :: String
  }

instance funcIsForeign :: IsForeign Func where
  read value = do
    n <- readProp "name" value
    ps <- readProp "parameters" value
    ret <- readProp "return_type" value
    pure $ Func { name: n, parameters: ps, returnType: ret }

type Parameter = Array String

--data Parameter = Parameter String String
--
--instance parameterIsForeign :: IsForeign Parameter where
--  read value = readArray value >>= \v -> pure
--                   case v of
--                       [fa, fb] -> case [readString fa, readString fb] Parameter a b
--                       [] ->  Left "wrong number of elements in Parameter"

data Type = Type
  { id :: Int
  , prefix :: String
  }

instance typeIsForeign :: IsForeign Type where
  read value = do
    id <- readProp "id" value
    prefix <- readProp "prefix" value
    pure $ Type { id: id, prefix: prefix }

defTypes :: (Array String) -> String
defTypes = foldl (\s t -> s <> "foreign import data " <> t <> " :: *\n") ""

titlecase :: String -> String
titlecase "" = ""
titlecase s = Str.toUpper (Str.take 1 s) <> Str.drop 1 s

fnName :: String -> String
fnName n = maybe "" recombine ((uncons <<< Str.split (Str.Pattern "_")) n)
  where recombine { head: x, tail: xs } = foldl (\a s -> a <> titlecase s) x xs

fnType :: Func -> String
fnType (Func f) = fnArgs f.parameters

fnArgs :: (Array Parameter) -> String
fnArgs xs = foldl (\s a -> s <> typ a <> " -> ") "" xs
  where typ [t, _] = mapType t
        typ _ = "" -- TODO: throw error

fnArgNames :: (Array Parameter) -> String
fnArgNames = Str.joinWith " " <<< map name
  where name [_, n] = n
        name _ = "" -- TODO: throw error

arrayOfRegex :: Either String Regex
arrayOfRegex = regex "ArrayOf\\((\\w+)\\)" noFlags

arrayOfNRegex :: Either String Regex
arrayOfNRegex = regex "ArrayOf\\((\\w+), (\\d+)\\)" noFlags

test' :: Either String Regex -> String -> Boolean
test' (Left _) = \_ -> false
test' (Right re) = test re

match' :: Either String Regex -> String -> Maybe (Array (Maybe String))
match' (Left _) = \_ -> Nothing
match' (Right re) = match re

mapType :: String -> String
mapType "Dictionary" = "(StrMap String)"
mapType "Object" = "Foreign"
mapType "Integer" = "Int"
mapType "Array" = "(Array Foreign)"
mapType "void" = "Unit"
mapType t
  | test' arrayOfRegex t = case match' arrayOfRegex t of
                                Nothing -> "" -- TODO: throw error
                                Just matches -> case drop 1 matches of
                                                     [Just subT] -> wrap (mapType subT)
                                                     _ -> "" -- TODO: throw error
    where wrap subT = "(Array " <> subT <> ")"
  | test' arrayOfNRegex t = case match' arrayOfNRegex t of
                                 Nothing -> "" -- TODO: throw error
                                 Just matches -> case drop 1 matches of
                                                      [Just subT] -> wrap (mapType subT)
                                                      -- TODO: make new ADT for (Array a) when n is known
                                                      [(Just subT), (Just n)] -> wrap (mapType subT)
                                                      _ -> "" -- TODO: throw error
    where wrap subT = "(Array " <> subT <> ")"
  | otherwise = t

parameters f = if subname == "ui" || subname == "vi" then cons ["Vim", "vim"] f.parameters else f.parameters
  where subname = Str.take 2 f.name

defFunc :: Func -> String
defFunc (Func f) = "foreign import " <> name <> "' :: forall e1 e2. " <> args <> "(Error -> Eff e1 Unit) -> ("
  <> ret <>  " -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit" <> "\n\n"
  <> "-- | args: `" <> argNames <> "`\n"
  <> name <> " :: forall a. " <> args <> "Aff (plugin :: PLUGIN | a) " <> ret <> "\n"
  <> name <> " " <> argNames <> " = makeAff $ " <> name <> "' " <> argNames <> "\n\n\n"
    where name = fnName f.name
          params = parameters f
          args = fnArgs params
          argNames = fnArgNames params
          ret = mapType f.returnType

defForeignFunc :: Func -> String
defForeignFunc (Func f) = DefineJs.defAsyncFunc (fnName f.name) (map argName (parameters f))
  where argName [_, n] = n
        argName _ = ""


imports = """
import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types

""" 

exports :: (Array Func) -> String
exports fs = "  ( " <> Str.joinWith "\n  , " (map (\(Func f) -> fnName f.name) fs) <> "\n  )"

groupByMap :: forall a b. (a -> Tuple String b) -> (Array a) -> StrMap (Array b)
groupByMap fn = foldl (\d x -> let res = fn x in alter (append (snd res)) (fst res) d) empty
  where append x = Just <<< maybe' (\_ -> [x]) (flip snoc x)

--onlyNvim :: Array Func -> Array Func
--onlyNvim = foldl (\fs (Func f) -> maybe' (\_ -> snoc fs f) (snoc fs <<< changeName f) $ Str.stripPrefix (Str.Pattern "nvim_") f.name) []
--  where changeName f name = Func (f { name = name })

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

defineModule :: forall e. String -> (Array Func) -> Eff (err :: EXCEPTION, fs :: FS | e) Unit
defineModule m fs = sequence_ <<< map (\fn -> fn fs) $ effs
  where effs = [ writeTextFile' ("./src/Neovim/" <> m <> ".purs") <<< foldl (\s f -> s <> defFunc f) header
               , writeTextFile' ("./src/Neovim/" <> m <> ".js") <<< foldl (\s f -> s <> defForeignFunc f) DefineJs.header
               ]
        header = "module Neovim." <> m <> "\n" <> exports fs <> " where\n" <> imports <> "\n"

buildInterface :: forall e. ApiInfo -> Eff (err :: EXCEPTION, fs :: FS | e) Unit
buildInterface api = sequence_ $ fold (\arr k v -> snoc arr (defineModule k v)) [types] modules
  where modules = splitByModule api
        types = writeTextFile' ("./src/Neovim/Types.purs") $ foldl (<>) "module Neovim.Types where\n\n" (map defImport (keys modules))
        defImport d = "foreign import data " <> d <> " :: *\n"
