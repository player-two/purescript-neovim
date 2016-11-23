module Neovim.Nvim
  ( uiAttach
  , uiDetach
  , uiTryResize
  , uiSetOption
  , command
  , feedkeys
  , input
  , replaceTermcodes
  , commandOutput
  , eval
  , callFunction
  , strwidth
  , listRuntimePaths
  , setCurrentDir
  , getCurrentLine
  , setCurrentLine
  , delCurrentLine
  , getVar
  , setVar
  , delVar
  , getVvar
  , getOption
  , setOption
  , outWrite
  , errWrite
  , errWriteln
  , listBufs
  , getCurrentBuf
  , setCurrentBuf
  , listWins
  , getCurrentWin
  , setCurrentWin
  , listTabpages
  , getCurrentTabpage
  , setCurrentTabpage
  , subscribe
  , unsubscribe
  , getColorByName
  , getColorMap
  , getApiInfo
  , callAtomic
  ) where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


foreign import uiAttach' :: forall e1 e2. Vim -> Int -> Int -> (StrMap String) -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim width height options`
uiAttach :: forall a. Vim -> Int -> Int -> (StrMap String) -> Aff (plugin :: PLUGIN | a) Unit
uiAttach vim width height options = makeAff $ uiAttach' vim width height options


foreign import uiDetach' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
uiDetach :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Unit
uiDetach vim = makeAff $ uiDetach' vim


foreign import uiTryResize' :: forall e1 e2. Vim -> Int -> Int -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim width height`
uiTryResize :: forall a. Vim -> Int -> Int -> Aff (plugin :: PLUGIN | a) Unit
uiTryResize vim width height = makeAff $ uiTryResize' vim width height


foreign import uiSetOption' :: forall e1 e2. Vim -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim name value`
uiSetOption :: forall a. Vim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
uiSetOption vim name value = makeAff $ uiSetOption' vim name value


foreign import command' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `command`
command :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
command command = makeAff $ command' command


foreign import feedkeys' :: forall e1 e2. String -> String -> Boolean -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `keys mode escape_csi`
feedkeys :: forall a. String -> String -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
feedkeys keys mode escape_csi = makeAff $ feedkeys' keys mode escape_csi


foreign import input' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `keys`
input :: forall a. String -> Aff (plugin :: PLUGIN | a) Int
input keys = makeAff $ input' keys


foreign import replaceTermcodes' :: forall e1 e2. String -> Boolean -> Boolean -> Boolean -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `str from_part do_lt special`
replaceTermcodes :: forall a. String -> Boolean -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) String
replaceTermcodes str from_part do_lt special = makeAff $ replaceTermcodes' str from_part do_lt special


foreign import commandOutput' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `str`
commandOutput :: forall a. String -> Aff (plugin :: PLUGIN | a) String
commandOutput str = makeAff $ commandOutput' str


foreign import eval' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `expr`
eval :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
eval expr = makeAff $ eval' expr


foreign import callFunction' :: forall e1 e2. String -> (Array Foreign) -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `fname args`
callFunction :: forall a. String -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) Foreign
callFunction fname args = makeAff $ callFunction' fname args


foreign import strwidth' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `str`
strwidth :: forall a. String -> Aff (plugin :: PLUGIN | a) Int
strwidth str = makeAff $ strwidth' str


foreign import listRuntimePaths' :: forall e1 e2. (Error -> Eff e1 Unit) -> ((Array String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
listRuntimePaths :: forall a. Aff (plugin :: PLUGIN | a) (Array String)
listRuntimePaths  = makeAff $ listRuntimePaths' 


foreign import setCurrentDir' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `dir`
setCurrentDir :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
setCurrentDir dir = makeAff $ setCurrentDir' dir


foreign import getCurrentLine' :: forall e1 e2. (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
getCurrentLine :: forall a. Aff (plugin :: PLUGIN | a) String
getCurrentLine  = makeAff $ getCurrentLine' 


foreign import setCurrentLine' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `line`
setCurrentLine :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
setCurrentLine line = makeAff $ setCurrentLine' line


foreign import delCurrentLine' :: forall e1 e2. (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
delCurrentLine :: forall a. Aff (plugin :: PLUGIN | a) Unit
delCurrentLine  = makeAff $ delCurrentLine' 


foreign import getVar' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `name`
getVar :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
getVar name = makeAff $ getVar' name


foreign import setVar' :: forall e1 e2. String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `name value`
setVar :: forall a. String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setVar name value = makeAff $ setVar' name value


foreign import delVar' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `name`
delVar :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
delVar name = makeAff $ delVar' name


foreign import getVvar' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `name`
getVvar :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
getVvar name = makeAff $ getVvar' name


foreign import getOption' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `name`
getOption :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
getOption name = makeAff $ getOption' name


foreign import setOption' :: forall e1 e2. String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `name value`
setOption :: forall a. String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setOption name value = makeAff $ setOption' name value


foreign import outWrite' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `str`
outWrite :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
outWrite str = makeAff $ outWrite' str


foreign import errWrite' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `str`
errWrite :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
errWrite str = makeAff $ errWrite' str


foreign import errWriteln' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `str`
errWriteln :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
errWriteln str = makeAff $ errWriteln' str


foreign import listBufs' :: forall e1 e2. (Error -> Eff e1 Unit) -> ((Array Buffer) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
listBufs :: forall a. Aff (plugin :: PLUGIN | a) (Array Buffer)
listBufs  = makeAff $ listBufs' 


foreign import getCurrentBuf' :: forall e1 e2. (Error -> Eff e1 Unit) -> (Buffer -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
getCurrentBuf :: forall a. Aff (plugin :: PLUGIN | a) Buffer
getCurrentBuf  = makeAff $ getCurrentBuf' 


foreign import setCurrentBuf' :: forall e1 e2. Buffer -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer`
setCurrentBuf :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Unit
setCurrentBuf buffer = makeAff $ setCurrentBuf' buffer


foreign import listWins' :: forall e1 e2. (Error -> Eff e1 Unit) -> ((Array Window) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
listWins :: forall a. Aff (plugin :: PLUGIN | a) (Array Window)
listWins  = makeAff $ listWins' 


foreign import getCurrentWin' :: forall e1 e2. (Error -> Eff e1 Unit) -> (Window -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
getCurrentWin :: forall a. Aff (plugin :: PLUGIN | a) Window
getCurrentWin  = makeAff $ getCurrentWin' 


foreign import setCurrentWin' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
setCurrentWin :: forall a. Window -> Aff (plugin :: PLUGIN | a) Unit
setCurrentWin window = makeAff $ setCurrentWin' window


foreign import listTabpages' :: forall e1 e2. (Error -> Eff e1 Unit) -> ((Array Tabpage) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
listTabpages :: forall a. Aff (plugin :: PLUGIN | a) (Array Tabpage)
listTabpages  = makeAff $ listTabpages' 


foreign import getCurrentTabpage' :: forall e1 e2. (Error -> Eff e1 Unit) -> (Tabpage -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
getCurrentTabpage :: forall a. Aff (plugin :: PLUGIN | a) Tabpage
getCurrentTabpage  = makeAff $ getCurrentTabpage' 


foreign import setCurrentTabpage' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage`
setCurrentTabpage :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Unit
setCurrentTabpage tabpage = makeAff $ setCurrentTabpage' tabpage


foreign import subscribe' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `event`
subscribe :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
subscribe event = makeAff $ subscribe' event


foreign import unsubscribe' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `event`
unsubscribe :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
unsubscribe event = makeAff $ unsubscribe' event


foreign import getColorByName' :: forall e1 e2. String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `name`
getColorByName :: forall a. String -> Aff (plugin :: PLUGIN | a) Int
getColorByName name = makeAff $ getColorByName' name


foreign import getColorMap' :: forall e1 e2. (Error -> Eff e1 Unit) -> ((StrMap String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
getColorMap :: forall a. Aff (plugin :: PLUGIN | a) (StrMap String)
getColorMap  = makeAff $ getColorMap' 


foreign import getApiInfo' :: forall e1 e2. (Error -> Eff e1 Unit) -> ((Array Foreign) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: ``
getApiInfo :: forall a. Aff (plugin :: PLUGIN | a) (Array Foreign)
getApiInfo  = makeAff $ getApiInfo' 


foreign import callAtomic' :: forall e1 e2. (Array Foreign) -> (Error -> Eff e1 Unit) -> ((Array Foreign) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `calls`
callAtomic :: forall a. (Array Foreign) -> Aff (plugin :: PLUGIN | a) (Array Foreign)
callAtomic calls = makeAff $ callAtomic' calls


