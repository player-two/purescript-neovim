module Neovim.Buffer where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


foreign import lineCount' :: forall e. Buffer -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

lineCount :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
lineCount buffer = makeAff $ lineCount' buffer


foreign import getLine' :: forall e. Buffer -> Int -> (Error -> Eff e Unit) -> (String -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getLine :: forall a. Buffer -> Int -> Aff (plugin :: PLUGIN | a) String
getLine buffer index = makeAff $ getLine' buffer index


foreign import setLine' :: forall e. Buffer -> Int -> String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setLine :: forall a. Buffer -> Int -> String -> Aff (plugin :: PLUGIN | a) Unit
setLine buffer index line = makeAff $ setLine' buffer index line


foreign import delLine' :: forall e. Buffer -> Int -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

delLine :: forall a. Buffer -> Int -> Aff (plugin :: PLUGIN | a) Unit
delLine buffer index = makeAff $ delLine' buffer index


foreign import getLineSlice' :: forall e. Buffer -> Int -> Int -> Boolean -> Boolean -> (Error -> Eff e Unit) -> ((Array String) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getLineSlice :: forall a. Buffer -> Int -> Int -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) (Array String)
getLineSlice buffer start end include_start include_end = makeAff $ getLineSlice' buffer start end include_start include_end


foreign import getLines' :: forall e. Buffer -> Int -> Int -> Boolean -> (Error -> Eff e Unit) -> ((Array String) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getLines :: forall a. Buffer -> Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) (Array String)
getLines buffer start end strict_indexing = makeAff $ getLines' buffer start end strict_indexing


foreign import setLineSlice' :: forall e. Buffer -> Int -> Int -> Boolean -> Boolean -> (Array String) -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setLineSlice :: forall a. Buffer -> Int -> Int -> Boolean -> Boolean -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
setLineSlice buffer start end include_start include_end replacement = makeAff $ setLineSlice' buffer start end include_start include_end replacement


foreign import setLines' :: forall e. Buffer -> Int -> Int -> Boolean -> (Array String) -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setLines :: forall a. Buffer -> Int -> Int -> Boolean -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
setLines buffer start end strict_indexing replacement = makeAff $ setLines' buffer start end strict_indexing replacement


foreign import getVar' :: forall e. Buffer -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar buffer name = makeAff $ getVar' buffer name


foreign import setVar' :: forall e. Buffer -> String -> Foreign -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setVar :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
setVar buffer name value = makeAff $ setVar' buffer name value


foreign import delVar' :: forall e. Buffer -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

delVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
delVar buffer name = makeAff $ delVar' buffer name


foreign import getOption' :: forall e. Buffer -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getOption :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
getOption buffer name = makeAff $ getOption' buffer name


foreign import setOption' :: forall e. Buffer -> String -> Foreign -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setOption :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setOption buffer name value = makeAff $ setOption' buffer name value


foreign import getNumber' :: forall e. Buffer -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getNumber :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
getNumber buffer = makeAff $ getNumber' buffer


foreign import getName' :: forall e. Buffer -> (Error -> Eff e Unit) -> (String -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getName :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) String
getName buffer = makeAff $ getName' buffer


foreign import setName' :: forall e. Buffer -> String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setName :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Unit
setName buffer name = makeAff $ setName' buffer name


foreign import isValid' :: forall e. Buffer -> (Error -> Eff e Unit) -> (Boolean -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

isValid :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Boolean
isValid buffer = makeAff $ isValid' buffer


foreign import insert' :: forall e. Buffer -> Int -> (Array String) -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

insert :: forall a. Buffer -> Int -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
insert buffer lnum lines = makeAff $ insert' buffer lnum lines


foreign import getMark' :: forall e. Buffer -> String -> (Error -> Eff e Unit) -> ((Array Int) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getMark :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) (Array Int)
getMark buffer name = makeAff $ getMark' buffer name


foreign import addHighlight' :: forall e. Buffer -> Int -> String -> Int -> Int -> Int -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

addHighlight :: forall a. Buffer -> Int -> String -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Int
addHighlight buffer src_id hl_group line col_start col_end = makeAff $ addHighlight' buffer src_id hl_group line col_start col_end


foreign import clearHighlight' :: forall e. Buffer -> Int -> Int -> Int -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

clearHighlight :: forall a. Buffer -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Unit
clearHighlight buffer src_id line_start line_end = makeAff $ clearHighlight' buffer src_id line_start line_end


