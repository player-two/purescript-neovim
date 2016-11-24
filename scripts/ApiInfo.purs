module ApiInfo where

import Prelude
import Data.Array (cons, drop, filter, snoc, uncons)
import Data.Either (either, Either(Left, Right))
import Data.Foldable (foldl)
import Data.Foreign (unsafeFromForeign, unsafeReadTagged, Foreign, F)
import Data.Foreign.Class (readProp, readJSON, class IsForeign)
import Data.Maybe (maybe, maybe', Maybe(Just, Nothing))
import Data.StrMap (alter, empty, fold, fromFoldable, insert, keys, lookup, StrMap)
import Data.String as Str
import Data.String.Regex (match, regex, test, Regex)
import Data.String.Regex.Flags (noFlags)
import Data.Tuple (Tuple(..))

data ApiInfo = ApiInfo
  { functions :: Array Func
  , types :: StrMap Type
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
