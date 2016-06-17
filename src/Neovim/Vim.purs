module Neovim.Vim where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


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


