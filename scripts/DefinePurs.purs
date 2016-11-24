module DefinePurs where

import Prelude
import Data.Array (cons, foldl, uncons)
import Data.Maybe (maybe)
import Data.String (drop, joinWith, split, take, toUpper, Pattern(..))

import ApiInfo (Func(..), Parameter)
import ApiInfo as ApiInfo
import DefineJs as DefineJs


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

titlecase :: String -> String
titlecase "" = ""
titlecase s = toUpper (take 1 s) <> drop 1 s

fnArgNames :: (Array Parameter) -> String
fnArgNames = joinWith " " <<< map name
  where name [_, n] = n
        name _ = "" -- TODO: throw error

fnType :: Func -> String
fnType (Func f) = fnArgs f.parameters

fnArgs :: (Array Parameter) -> String
fnArgs xs = foldl (\s a -> s <> typ a <> " -> ") "" xs
  where typ [t, _] = ApiInfo.mapType t
        typ _ = "" -- TODO: throw error

fnName :: String -> String
fnName n = maybe "" recombine ((uncons <<< split (Pattern "_")) n)
  where recombine { head: x, tail: xs } = foldl (\a s -> a <> titlecase s) x xs

defTypes :: (Array String) -> String
defTypes = foldl (\s t -> s <> "foreign import data " <> t <> " :: *\n") ""

exports :: (Array Func) -> String
exports fs = "  ( " <> joinWith "\n  , " (map (\(Func f) -> fnName f.name) fs) <> "\n  )"

defImport d = "foreign import data " <> d <> " :: *\n"

defFunc :: Func -> String
defFunc (Func f) = "foreign import " <> name <> "' :: forall e1 e2. " <> args <> "(Error -> Eff e1 Unit) -> ("
  <> ret <>  " -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit" <> "\n\n"
  <> "-- | args: `" <> argNames <> "`\n"
  <> name <> " :: forall a. " <> args <> "Aff (plugin :: PLUGIN | a) " <> ret <> "\n"
  <> name <> " " <> argNames <> " = makeAff $ " <> name <> "' " <> argNames <> "\n\n\n"
    where name = fnName f.name
          args = fnArgs f.parameters
          argNames = fnArgNames f.parameters
          ret = ApiInfo.mapType f.returnType

defForeignFunc :: Func -> String
defForeignFunc (Func f) = DefineJs.defAsyncFunc (fnName f.name) (map argName f.parameters)
  where argName [_, n] = n
        argName _ = ""
