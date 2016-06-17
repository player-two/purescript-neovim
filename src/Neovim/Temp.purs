
module Neovim.Temp where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)

foreign import data Buffer :: *
foreign import data Window :: *
foreign import data Tabpage :: *

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

foreign import getWindows' :: forall e. Tabpage -> (Error -> Eff e Unit) -> ((Array Window) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getWindows :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) (Array Window)
getWindows tabpage = makeAff $ getWindows' tabpage

foreign import getVar' :: forall e. Tabpage -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar tabpage name = makeAff $ getVar' tabpage name

foreign import setVar' :: forall e. Tabpage -> String -> Foreign -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setVar :: forall a. Tabpage -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
setVar tabpage name value = makeAff $ setVar' tabpage name value

foreign import delVar' :: forall e. Tabpage -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
delVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
delVar tabpage name = makeAff $ delVar' tabpage name

foreign import getWindow' :: forall e. Tabpage -> (Error -> Eff e Unit) -> (Window -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getWindow :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Window
getWindow tabpage = makeAff $ getWindow' tabpage

foreign import isValid' :: forall e. Tabpage -> (Error -> Eff e Unit) -> (Boolean -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
isValid :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Boolean
isValid tabpage = makeAff $ isValid' tabpage

foreign import attach' :: forall e. Int -> Int -> Boolean -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
attach :: forall a. Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
attach width height enable_rgb = makeAff $ attach' width height enable_rgb

foreign import detach' :: forall e. (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
detach :: forall a. Aff (plugin :: PLUGIN | a) Unit
detach  = makeAff $ detach' 

foreign import tryResize' :: forall e. Int -> Int -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
tryResize :: forall a. Int -> Int -> Aff (plugin :: PLUGIN | a) Foreign
tryResize width height = makeAff $ tryResize' width height

foreign import command' :: forall e. String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
command :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
command str = makeAff $ command' str

foreign import feedkeys' :: forall e. String -> String -> Boolean -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
feedkeys :: forall a. String -> String -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
feedkeys keys mode escape_csi = makeAff $ feedkeys' keys mode escape_csi

foreign import input' :: forall e. String -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
input :: forall a. String -> Aff (plugin :: PLUGIN | a) Int
input keys = makeAff $ input' keys

foreign import replaceTermcodes' :: forall e. String -> Boolean -> Boolean -> Boolean -> (Error -> Eff e Unit) -> (String -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
replaceTermcodes :: forall a. String -> Boolean -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) String
replaceTermcodes str from_part do_lt special = makeAff $ replaceTermcodes' str from_part do_lt special

foreign import commandOutput' :: forall e. String -> (Error -> Eff e Unit) -> (String -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
commandOutput :: forall a. String -> Aff (plugin :: PLUGIN | a) String
commandOutput str = makeAff $ commandOutput' str

foreign import eval' :: forall e. String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
eval :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
eval str = makeAff $ eval' str

foreign import callFunction' :: forall e. String -> Array -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
callFunction :: forall a. String -> Array -> Aff (plugin :: PLUGIN | a) Foreign
callFunction fname args = makeAff $ callFunction' fname args

foreign import strwidth' :: forall e. String -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
strwidth :: forall a. String -> Aff (plugin :: PLUGIN | a) Int
strwidth str = makeAff $ strwidth' str

foreign import listRuntimePaths' :: forall e. (Error -> Eff e Unit) -> ((Array String) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
listRuntimePaths :: forall a. Aff (plugin :: PLUGIN | a) (Array String)
listRuntimePaths  = makeAff $ listRuntimePaths' 

foreign import changeDirectory' :: forall e. String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
changeDirectory :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
changeDirectory dir = makeAff $ changeDirectory' dir

foreign import getCurrentLine' :: forall e. (Error -> Eff e Unit) -> (String -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getCurrentLine :: forall a. Aff (plugin :: PLUGIN | a) String
getCurrentLine  = makeAff $ getCurrentLine' 

foreign import setCurrentLine' :: forall e. String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setCurrentLine :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
setCurrentLine line = makeAff $ setCurrentLine' line

foreign import delCurrentLine' :: forall e. (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
delCurrentLine :: forall a. Aff (plugin :: PLUGIN | a) Unit
delCurrentLine  = makeAff $ delCurrentLine' 

foreign import getVar' :: forall e. String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getVar :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
getVar name = makeAff $ getVar' name

foreign import setVar' :: forall e. String -> Foreign -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setVar :: forall a. String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
setVar name value = makeAff $ setVar' name value

foreign import delVar' :: forall e. String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
delVar :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
delVar name = makeAff $ delVar' name

foreign import getVvar' :: forall e. String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getVvar :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
getVvar name = makeAff $ getVvar' name

foreign import getOption' :: forall e. String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getOption :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
getOption name = makeAff $ getOption' name

foreign import setOption' :: forall e. String -> Foreign -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setOption :: forall a. String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setOption name value = makeAff $ setOption' name value

foreign import outWrite' :: forall e. String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
outWrite :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
outWrite str = makeAff $ outWrite' str

foreign import errWrite' :: forall e. String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
errWrite :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
errWrite str = makeAff $ errWrite' str

foreign import reportError' :: forall e. String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
reportError :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
reportError str = makeAff $ reportError' str

foreign import getBuffers' :: forall e. (Error -> Eff e Unit) -> ((Array Buffer) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getBuffers :: forall a. Aff (plugin :: PLUGIN | a) (Array Buffer)
getBuffers  = makeAff $ getBuffers' 

foreign import getCurrentBuffer' :: forall e. (Error -> Eff e Unit) -> (Buffer -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getCurrentBuffer :: forall a. Aff (plugin :: PLUGIN | a) Buffer
getCurrentBuffer  = makeAff $ getCurrentBuffer' 

foreign import setCurrentBuffer' :: forall e. Buffer -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setCurrentBuffer :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Unit
setCurrentBuffer buffer = makeAff $ setCurrentBuffer' buffer

foreign import getWindows' :: forall e. (Error -> Eff e Unit) -> ((Array Window) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getWindows :: forall a. Aff (plugin :: PLUGIN | a) (Array Window)
getWindows  = makeAff $ getWindows' 

foreign import getCurrentWindow' :: forall e. (Error -> Eff e Unit) -> (Window -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getCurrentWindow :: forall a. Aff (plugin :: PLUGIN | a) Window
getCurrentWindow  = makeAff $ getCurrentWindow' 

foreign import setCurrentWindow' :: forall e. Window -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setCurrentWindow :: forall a. Window -> Aff (plugin :: PLUGIN | a) Unit
setCurrentWindow window = makeAff $ setCurrentWindow' window

foreign import getTabpages' :: forall e. (Error -> Eff e Unit) -> ((Array Tabpage) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getTabpages :: forall a. Aff (plugin :: PLUGIN | a) (Array Tabpage)
getTabpages  = makeAff $ getTabpages' 

foreign import getCurrentTabpage' :: forall e. (Error -> Eff e Unit) -> (Tabpage -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getCurrentTabpage :: forall a. Aff (plugin :: PLUGIN | a) Tabpage
getCurrentTabpage  = makeAff $ getCurrentTabpage' 

foreign import setCurrentTabpage' :: forall e. Tabpage -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setCurrentTabpage :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Unit
setCurrentTabpage tabpage = makeAff $ setCurrentTabpage' tabpage

foreign import subscribe' :: forall e. String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
subscribe :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
subscribe event = makeAff $ subscribe' event

foreign import unsubscribe' :: forall e. String -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
unsubscribe :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
unsubscribe event = makeAff $ unsubscribe' event

foreign import nameToColor' :: forall e. String -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
nameToColor :: forall a. String -> Aff (plugin :: PLUGIN | a) Int
nameToColor name = makeAff $ nameToColor' name

foreign import getColorMap' :: forall e. (Error -> Eff e Unit) -> (StrMap String -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getColorMap :: forall a. Aff (plugin :: PLUGIN | a) StrMap String
getColorMap  = makeAff $ getColorMap' 

foreign import getApiInfo' :: forall e. (Error -> Eff e Unit) -> (Array -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getApiInfo :: forall a. Aff (plugin :: PLUGIN | a) Array
getApiInfo  = makeAff $ getApiInfo' 

foreign import getBuffer' :: forall e. Window -> (Error -> Eff e Unit) -> (Buffer -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getBuffer :: forall a. Window -> Aff (plugin :: PLUGIN | a) Buffer
getBuffer window = makeAff $ getBuffer' window

foreign import getCursor' :: forall e. Window -> (Error -> Eff e Unit) -> ((Array Int) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getCursor :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
getCursor window = makeAff $ getCursor' window

foreign import setCursor' :: forall e. Window -> (Array Int) -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setCursor :: forall a. Window -> (Array Int) -> Aff (plugin :: PLUGIN | a) Unit
setCursor window pos = makeAff $ setCursor' window pos

foreign import getHeight' :: forall e. Window -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getHeight :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
getHeight window = makeAff $ getHeight' window

foreign import setHeight' :: forall e. Window -> Int -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setHeight :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
setHeight window height = makeAff $ setHeight' window height

foreign import getWidth' :: forall e. Window -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getWidth :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
getWidth window = makeAff $ getWidth' window

foreign import setWidth' :: forall e. Window -> Int -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setWidth :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
setWidth window width = makeAff $ setWidth' window width

foreign import getVar' :: forall e. Window -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar window name = makeAff $ getVar' window name

foreign import setVar' :: forall e. Window -> String -> Foreign -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setVar :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
setVar window name value = makeAff $ setVar' window name value

foreign import delVar' :: forall e. Window -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
delVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
delVar window name = makeAff $ delVar' window name

foreign import getOption' :: forall e. Window -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getOption :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
getOption window name = makeAff $ getOption' window name

foreign import setOption' :: forall e. Window -> String -> Foreign -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
setOption :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setOption window name value = makeAff $ setOption' window name value

foreign import getPosition' :: forall e. Window -> (Error -> Eff e Unit) -> ((Array Int) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getPosition :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
getPosition window = makeAff $ getPosition' window

foreign import getTabpage' :: forall e. Window -> (Error -> Eff e Unit) -> (Tabpage -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
getTabpage :: forall a. Window -> Aff (plugin :: PLUGIN | a) Tabpage
getTabpage window = makeAff $ getTabpage' window

foreign import isValid' :: forall e. Window -> (Error -> Eff e Unit) -> (Boolean -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit
isValid :: forall a. Window -> Aff (plugin :: PLUGIN | a) Boolean
isValid window = makeAff $ isValid' window

