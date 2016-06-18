module Neovim.Vim where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


foreign import command' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

command :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
command vim str = makeAff $ command' vim str


foreign import feedkeys' :: forall e1 e2. Vim -> String -> String -> Boolean -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

feedkeys :: forall a. Vim -> String -> String -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
feedkeys vim keys mode escape_csi = makeAff $ feedkeys' vim keys mode escape_csi


foreign import input' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

input :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
input vim keys = makeAff $ input' vim keys


foreign import replaceTermcodes' :: forall e1 e2. Vim -> String -> Boolean -> Boolean -> Boolean -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

replaceTermcodes :: forall a. Vim -> String -> Boolean -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) String
replaceTermcodes vim str from_part do_lt special = makeAff $ replaceTermcodes' vim str from_part do_lt special


foreign import commandOutput' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

commandOutput :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) String
commandOutput vim str = makeAff $ commandOutput' vim str


foreign import eval' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

eval :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
eval vim str = makeAff $ eval' vim str


foreign import callFunction' :: forall e1 e2. Vim -> String -> (Array Foreign) -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

callFunction :: forall a. Vim -> String -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) Foreign
callFunction vim fname args = makeAff $ callFunction' vim fname args


foreign import strwidth' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

strwidth :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
strwidth vim str = makeAff $ strwidth' vim str


foreign import listRuntimePaths' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

listRuntimePaths :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array String)
listRuntimePaths vim = makeAff $ listRuntimePaths' vim


foreign import changeDirectory' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

changeDirectory :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
changeDirectory vim dir = makeAff $ changeDirectory' vim dir


foreign import getCurrentLine' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getCurrentLine :: forall a. Vim -> Aff (plugin :: PLUGIN | a) String
getCurrentLine vim = makeAff $ getCurrentLine' vim


foreign import setCurrentLine' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

setCurrentLine :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
setCurrentLine vim line = makeAff $ setCurrentLine' vim line


foreign import delCurrentLine' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

delCurrentLine :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Unit
delCurrentLine vim = makeAff $ delCurrentLine' vim


foreign import getVar' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getVar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar vim name = makeAff $ getVar' vim name


foreign import setVar' :: forall e1 e2. Vim -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

setVar :: forall a. Vim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
setVar vim name value = makeAff $ setVar' vim name value


foreign import delVar' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

delVar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
delVar vim name = makeAff $ delVar' vim name


foreign import getVvar' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getVvar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVvar vim name = makeAff $ getVvar' vim name


foreign import getOption' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getOption :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
getOption vim name = makeAff $ getOption' vim name


foreign import setOption' :: forall e1 e2. Vim -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

setOption :: forall a. Vim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setOption vim name value = makeAff $ setOption' vim name value


foreign import outWrite' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

outWrite :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
outWrite vim str = makeAff $ outWrite' vim str


foreign import errWrite' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

errWrite :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
errWrite vim str = makeAff $ errWrite' vim str


foreign import reportError' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

reportError :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
reportError vim str = makeAff $ reportError' vim str


foreign import getBuffers' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array Buffer) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getBuffers :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Buffer)
getBuffers vim = makeAff $ getBuffers' vim


foreign import getCurrentBuffer' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Buffer -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getCurrentBuffer :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Buffer
getCurrentBuffer vim = makeAff $ getCurrentBuffer' vim


foreign import setCurrentBuffer' :: forall e1 e2. Vim -> Buffer -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

setCurrentBuffer :: forall a. Vim -> Buffer -> Aff (plugin :: PLUGIN | a) Unit
setCurrentBuffer vim buffer = makeAff $ setCurrentBuffer' vim buffer


foreign import getWindows' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array Window) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getWindows :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Window)
getWindows vim = makeAff $ getWindows' vim


foreign import getCurrentWindow' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Window -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getCurrentWindow :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Window
getCurrentWindow vim = makeAff $ getCurrentWindow' vim


foreign import setCurrentWindow' :: forall e1 e2. Vim -> Window -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

setCurrentWindow :: forall a. Vim -> Window -> Aff (plugin :: PLUGIN | a) Unit
setCurrentWindow vim window = makeAff $ setCurrentWindow' vim window


foreign import getTabpages' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array Tabpage) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getTabpages :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Tabpage)
getTabpages vim = makeAff $ getTabpages' vim


foreign import getCurrentTabpage' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Tabpage -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getCurrentTabpage :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Tabpage
getCurrentTabpage vim = makeAff $ getCurrentTabpage' vim


foreign import setCurrentTabpage' :: forall e1 e2. Vim -> Tabpage -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

setCurrentTabpage :: forall a. Vim -> Tabpage -> Aff (plugin :: PLUGIN | a) Unit
setCurrentTabpage vim tabpage = makeAff $ setCurrentTabpage' vim tabpage


foreign import subscribe' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

subscribe :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
subscribe vim event = makeAff $ subscribe' vim event


foreign import unsubscribe' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

unsubscribe :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
unsubscribe vim event = makeAff $ unsubscribe' vim event


foreign import nameToColor' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

nameToColor :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
nameToColor vim name = makeAff $ nameToColor' vim name


foreign import getColorMap' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((StrMap String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getColorMap :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (StrMap String)
getColorMap vim = makeAff $ getColorMap' vim


foreign import getApiInfo' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array Foreign) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getApiInfo :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Foreign)
getApiInfo vim = makeAff $ getApiInfo' vim


