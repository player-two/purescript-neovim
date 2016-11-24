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


foreign import uiAttach' :: forall e1 e2. Nvim -> Int -> Int -> (StrMap String) -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim width height options`
uiAttach :: forall a. Nvim -> Int -> Int -> (StrMap String) -> Aff (plugin :: PLUGIN | a) Unit
uiAttach nvim width height options = makeAff $ uiAttach' nvim width height options


foreign import uiDetach' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
uiDetach :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Unit
uiDetach nvim = makeAff $ uiDetach' nvim


foreign import uiTryResize' :: forall e1 e2. Nvim -> Int -> Int -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim width height`
uiTryResize :: forall a. Nvim -> Int -> Int -> Aff (plugin :: PLUGIN | a) Unit
uiTryResize nvim width height = makeAff $ uiTryResize' nvim width height


foreign import uiSetOption' :: forall e1 e2. Nvim -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim name value`
uiSetOption :: forall a. Nvim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
uiSetOption nvim name value = makeAff $ uiSetOption' nvim name value


foreign import command' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim command`
command :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
command nvim command = makeAff $ command' nvim command


foreign import feedkeys' :: forall e1 e2. Nvim -> String -> String -> Boolean -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim keys mode escape_csi`
feedkeys :: forall a. Nvim -> String -> String -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
feedkeys nvim keys mode escape_csi = makeAff $ feedkeys' nvim keys mode escape_csi


foreign import input' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim keys`
input :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Int
input nvim keys = makeAff $ input' nvim keys


foreign import replaceTermcodes' :: forall e1 e2. Nvim -> String -> Boolean -> Boolean -> Boolean -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim str from_part do_lt special`
replaceTermcodes :: forall a. Nvim -> String -> Boolean -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) String
replaceTermcodes nvim str from_part do_lt special = makeAff $ replaceTermcodes' nvim str from_part do_lt special


foreign import commandOutput' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim str`
commandOutput :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) String
commandOutput nvim str = makeAff $ commandOutput' nvim str


foreign import eval' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim expr`
eval :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Foreign
eval nvim expr = makeAff $ eval' nvim expr


foreign import callFunction' :: forall e1 e2. Nvim -> String -> (Array Foreign) -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim fname args`
callFunction :: forall a. Nvim -> String -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) Foreign
callFunction nvim fname args = makeAff $ callFunction' nvim fname args


foreign import strwidth' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim str`
strwidth :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Int
strwidth nvim str = makeAff $ strwidth' nvim str


foreign import listRuntimePaths' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> ((Array String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
listRuntimePaths :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array String)
listRuntimePaths nvim = makeAff $ listRuntimePaths' nvim


foreign import setCurrentDir' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim dir`
setCurrentDir :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
setCurrentDir nvim dir = makeAff $ setCurrentDir' nvim dir


foreign import getCurrentLine' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
getCurrentLine :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) String
getCurrentLine nvim = makeAff $ getCurrentLine' nvim


foreign import setCurrentLine' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim line`
setCurrentLine :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
setCurrentLine nvim line = makeAff $ setCurrentLine' nvim line


foreign import delCurrentLine' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
delCurrentLine :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Unit
delCurrentLine nvim = makeAff $ delCurrentLine' nvim


foreign import getVar' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim name`
getVar :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar nvim name = makeAff $ getVar' nvim name


foreign import setVar' :: forall e1 e2. Nvim -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim name value`
setVar :: forall a. Nvim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setVar nvim name value = makeAff $ setVar' nvim name value


foreign import delVar' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim name`
delVar :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
delVar nvim name = makeAff $ delVar' nvim name


foreign import getVvar' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim name`
getVvar :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVvar nvim name = makeAff $ getVvar' nvim name


foreign import getOption' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim name`
getOption :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Foreign
getOption nvim name = makeAff $ getOption' nvim name


foreign import setOption' :: forall e1 e2. Nvim -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim name value`
setOption :: forall a. Nvim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setOption nvim name value = makeAff $ setOption' nvim name value


foreign import outWrite' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim str`
outWrite :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
outWrite nvim str = makeAff $ outWrite' nvim str


foreign import errWrite' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim str`
errWrite :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
errWrite nvim str = makeAff $ errWrite' nvim str


foreign import errWriteln' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim str`
errWriteln :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
errWriteln nvim str = makeAff $ errWriteln' nvim str


foreign import listBufs' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> ((Array Buffer) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
listBufs :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array Buffer)
listBufs nvim = makeAff $ listBufs' nvim


foreign import getCurrentBuf' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> (Buffer -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
getCurrentBuf :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Buffer
getCurrentBuf nvim = makeAff $ getCurrentBuf' nvim


foreign import setCurrentBuf' :: forall e1 e2. Nvim -> Buffer -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim buffer`
setCurrentBuf :: forall a. Nvim -> Buffer -> Aff (plugin :: PLUGIN | a) Unit
setCurrentBuf nvim buffer = makeAff $ setCurrentBuf' nvim buffer


foreign import listWins' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> ((Array Window) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
listWins :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array Window)
listWins nvim = makeAff $ listWins' nvim


foreign import getCurrentWin' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> (Window -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
getCurrentWin :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Window
getCurrentWin nvim = makeAff $ getCurrentWin' nvim


foreign import setCurrentWin' :: forall e1 e2. Nvim -> Window -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim window`
setCurrentWin :: forall a. Nvim -> Window -> Aff (plugin :: PLUGIN | a) Unit
setCurrentWin nvim window = makeAff $ setCurrentWin' nvim window


foreign import listTabpages' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> ((Array Tabpage) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
listTabpages :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array Tabpage)
listTabpages nvim = makeAff $ listTabpages' nvim


foreign import getCurrentTabpage' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> (Tabpage -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
getCurrentTabpage :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Tabpage
getCurrentTabpage nvim = makeAff $ getCurrentTabpage' nvim


foreign import setCurrentTabpage' :: forall e1 e2. Nvim -> Tabpage -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim tabpage`
setCurrentTabpage :: forall a. Nvim -> Tabpage -> Aff (plugin :: PLUGIN | a) Unit
setCurrentTabpage nvim tabpage = makeAff $ setCurrentTabpage' nvim tabpage


foreign import subscribe' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim event`
subscribe :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
subscribe nvim event = makeAff $ subscribe' nvim event


foreign import unsubscribe' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim event`
unsubscribe :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
unsubscribe nvim event = makeAff $ unsubscribe' nvim event


foreign import getColorByName' :: forall e1 e2. Nvim -> String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim name`
getColorByName :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Int
getColorByName nvim name = makeAff $ getColorByName' nvim name


foreign import getColorMap' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> ((StrMap String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
getColorMap :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (StrMap String)
getColorMap nvim = makeAff $ getColorMap' nvim


foreign import getApiInfo' :: forall e1 e2. Nvim -> (Error -> Eff e1 Unit) -> ((Array Foreign) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim`
getApiInfo :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array Foreign)
getApiInfo nvim = makeAff $ getApiInfo' nvim


foreign import callAtomic' :: forall e1 e2. Nvim -> (Array Foreign) -> (Error -> Eff e1 Unit) -> ((Array Foreign) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `nvim calls`
callAtomic :: forall a. Nvim -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) (Array Foreign)
callAtomic nvim calls = makeAff $ callAtomic' nvim calls


