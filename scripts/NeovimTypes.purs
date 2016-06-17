module NeovimTypes where

import Prelude
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (log, CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Array (drop, snoc, uncons)
import Data.Either (either, Either(Left, Right))
import Data.Foldable (foldl, sequence_)
import Data.Foreign (unsafeFromForeign)
import Data.Foreign.Class (readJSON, readProp, class IsForeign)
--import Data.Foreign.Undefined (unUndefined, Undefined)
import Data.Maybe (Maybe(Just, Nothing))
import Data.StrMap (empty, fold, insert, keys, lookup, StrMap)
import Data.String (drop, joinWith, split, take, toUpper) as Str
import Data.String.Regex (match, noFlags, regex, test, Regex)
import Node.Buffer (toString, BUFFER)
import Node.ChildProcess (exec, ExecResult, CHILD_PROCESS)
import Node.Encoding (Encoding(UTF8))
import Node.FS (FS)
import Node.FS.Sync (writeTextFile)

import DefineJs as DefineJs


main :: forall e. Eff (buffer :: BUFFER, cp :: CHILD_PROCESS, console :: CONSOLE, err :: EXCEPTION, fs :: FS | e) Unit
main = exec "nvim --api-info | msgpack2json" handle

handle :: forall e. ExecResult -> Eff (buffer :: BUFFER, cp :: CHILD_PROCESS, console :: CONSOLE, err :: EXCEPTION, fs :: FS | e) Unit
handle { stderr: err, stdout: out, error: Nothing } = toString UTF8 out >>= (either err buildInterface <<< readJSON)
  where err = log <<< show
handle { error: Just e } = (log <<< show) e

data ApiInfo = ApiInfo
  { functions :: Array Func
  , typeDefs :: TypeDefs
  --, errorTypes:
  }

instance apiInfoIsForeign :: IsForeign ApiInfo where
  read value = do
    fs <- readProp "functions" value
    ts <- readProp "types" value
    pure $ ApiInfo { functions: fs , typeDefs: ts }

data Func = Func
  { name :: String
  , parameters :: Array Parameter
  , returnType :: String
  , async :: Boolean
  --, canFail :: Undefined Boolean
  }

instance funcIsForeign :: IsForeign Func where
  read value = do
    n <- readProp "name" value
    ps <- readProp "parameters" value
    ret <- readProp "return_type" value
    a <- readProp "async" value
    --cf <- readProp "can_fail" value
    pure $ Func { name: n, parameters: ps, returnType: ret, async: a } --, canFail: cf }

type Parameter = Array String

--data Parameter = Parameter String String
--
--instance parameterIsForeign :: IsForeign Parameter where
--  read value = readArray value >>= \v -> pure
--                   case v of
--                       [fa, fb] -> case [readString fa, readString fb] Parameter a b
--                       [] ->  Left "wrong number of elements in Parameter"
--data Type = Window | Buffer | Tabpage

newtype TypeDefs = TypeDefs (StrMap (StrMap Int))

getDefs :: TypeDefs -> StrMap (StrMap Int)
getDefs (TypeDefs tds) = tds

instance typeDefsIsForeign :: IsForeign TypeDefs where
  read = pure <<< unsafeFromForeign

defTypes :: (Array String) -> String
defTypes = foldl (\s t -> s <> "foreign import data " <> t <> " :: *\n") ""

titlecase :: String -> String
titlecase "" = ""
titlecase s = Str.toUpper (Str.take 1 s) <> Str.drop 1 s

fnName :: String -> String
fnName n = case (uncons <<< drop 1 <<< Str.split "_") n of
                Nothing -> "" -- TODO: throw an error
                Just { head: x, tail: xs } -> foldl (\a s -> a <> titlecase s) x xs

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
mapType "Dictionary" = "StrMap String"
mapType "Object" = "Foreign"
mapType "Integer" = "Int"
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

defFunc :: Func -> String
defFunc (Func f) = "foreign import " <> name <> "' :: forall e. " <> args <> "(Error -> Eff e Unit) -> (" <> ret <>  " -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit" <> "\n\n"
  <> name <> " :: forall a. " <> args <> "Aff (plugin :: PLUGIN | a) " <> ret <> "\n"
  <> name <> " " <> argNames <> " = makeAff $ " <> name <> "' " <> argNames <> "\n\n\n"
    where name = fnName f.name
          args = fnArgs f.parameters
          argNames = fnArgNames f.parameters
          ret = mapType f.returnType

defForeignFunc :: Func -> String
defForeignFunc (Func f) = DefineJs.defAsyncFunc (fnName f.name) (map argName f.parameters)
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

groupBy :: forall x. Array x -> (x -> String) -> StrMap (Array x)
groupBy xs fn = foldl (\m x -> appendToGroup m (fn x) x) empty xs
  where appendToGroup m k v = insert k (case lookup k m of
                                             Just others -> snoc others v
                                             Nothing -> [v]) m

splitByModule :: (Array Func) -> StrMap (Array Func)
splitByModule fs = groupBy fs moduleName
  where moduleName (Func f) = case (uncons <<< Str.split "_") f.name of
                                   Just { head: m } -> titlecase m
                                   Nothing -> "unknown" -- TODO: throw error

writeTextFile' = writeTextFile UTF8

defineModule :: forall e. String -> (Array Func) -> Eff (err :: EXCEPTION, fs :: FS | e) Unit
defineModule m fs = sequence_ <<< map (\fn -> fn fs) $ effs
  where effs = [ writeTextFile' ("./src/Neovim/" <> m <> ".purs") <<< foldl (\s f -> s <> defFunc f) header
               , writeTextFile' ("./src/Neovim/" <> m <> ".js") <<< foldl (\s f -> s <> defForeignFunc f) DefineJs.header
               ]
        header = "module Neovim." <> m <> " where\n" <> imports <> "\n"

buildInterface :: forall e. ApiInfo -> Eff (err :: EXCEPTION, fs :: FS | e) Unit
buildInterface (ApiInfo api) = sequence_ $ fold (\arr k v -> snoc arr (defineModule k v)) [types] modules
  where modules = splitByModule api.functions
        types = writeTextFile' ("./src/Neovim/Types.purs") $ foldl (<>) "module Neovim.Types where\n\n" (map defImport (keys modules))
        defImport d = "foreign import data " <> d <> " :: *\n"
