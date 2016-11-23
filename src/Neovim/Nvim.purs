module Neovim.Nvim
  ( bufferGetLine
  , bufferSetLine
  , bufferDelLine
  , bufferGetLineSlice
  , bufferSetLineSlice
  , bufferSetVar
  , bufferDelVar
  , bufferInsert
  , tabpageSetVar
  , tabpageDelVar
  , uiAttach
  , uiAttach
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
  , vimSetVar
  , vimDelVar
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
  , windowSetVar
  , windowDelVar
  , bufferLineCount
  , bufferGetLines
  , bufferSetLines
  , bufferGetVar
  , bufferGetOption
  , bufferSetOption
  , bufferGetNumber
  , bufferGetName
  , bufferSetName
  , bufferIsValid
  , bufferGetMark
  , bufferAddHighlight
  , bufferClearHighlight
  , tabpageGetWindows
  , tabpageGetVar
  , tabpageGetWindow
  , tabpageIsValid
  , uiDetach
  , uiTryResize
  , vimCommand
  , vimFeedkeys
  , vimInput
  , vimReplaceTermcodes
  , vimCommandOutput
  , vimEval
  , vimCallFunction
  , vimStrwidth
  , vimListRuntimePaths
  , vimChangeDirectory
  , vimGetCurrentLine
  , vimSetCurrentLine
  , vimDelCurrentLine
  , vimGetVar
  , vimGetVvar
  , vimGetOption
  , vimSetOption
  , vimOutWrite
  , vimErrWrite
  , vimReportError
  , vimGetBuffers
  , vimGetCurrentBuffer
  , vimSetCurrentBuffer
  , vimGetWindows
  , vimGetCurrentWindow
  , vimSetCurrentWindow
  , vimGetTabpages
  , vimGetCurrentTabpage
  , vimSetCurrentTabpage
  , vimSubscribe
  , vimUnsubscribe
  , vimNameToColor
  , vimGetColorMap
  , vimGetApiInfo
  , windowGetBuffer
  , windowGetCursor
  , windowSetCursor
  , windowGetHeight
  , windowSetHeight
  , windowGetWidth
  , windowSetWidth
  , windowGetVar
  , windowGetOption
  , windowSetOption
  , windowGetPosition
  , windowGetTabpage
  , windowIsValid
  ) where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


foreign import bufferGetLine' :: forall e1 e2. Buffer -> Int -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer index`
bufferGetLine :: forall a. Buffer -> Int -> Aff (plugin :: PLUGIN | a) String
bufferGetLine buffer index = makeAff $ bufferGetLine' buffer index


foreign import bufferSetLine' :: forall e1 e2. Buffer -> Int -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer index line`
bufferSetLine :: forall a. Buffer -> Int -> String -> Aff (plugin :: PLUGIN | a) Unit
bufferSetLine buffer index line = makeAff $ bufferSetLine' buffer index line


foreign import bufferDelLine' :: forall e1 e2. Buffer -> Int -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer index`
bufferDelLine :: forall a. Buffer -> Int -> Aff (plugin :: PLUGIN | a) Unit
bufferDelLine buffer index = makeAff $ bufferDelLine' buffer index


foreign import bufferGetLineSlice' :: forall e1 e2. Buffer -> Int -> Int -> Boolean -> Boolean -> (Error -> Eff e1 Unit) -> ((Array String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer start end include_start include_end`
bufferGetLineSlice :: forall a. Buffer -> Int -> Int -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) (Array String)
bufferGetLineSlice buffer start end include_start include_end = makeAff $ bufferGetLineSlice' buffer start end include_start include_end


foreign import bufferSetLineSlice' :: forall e1 e2. Buffer -> Int -> Int -> Boolean -> Boolean -> (Array String) -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer start end include_start include_end replacement`
bufferSetLineSlice :: forall a. Buffer -> Int -> Int -> Boolean -> Boolean -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
bufferSetLineSlice buffer start end include_start include_end replacement = makeAff $ bufferSetLineSlice' buffer start end include_start include_end replacement


foreign import bufferSetVar' :: forall e1 e2. Buffer -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer name value`
bufferSetVar :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
bufferSetVar buffer name value = makeAff $ bufferSetVar' buffer name value


foreign import bufferDelVar' :: forall e1 e2. Buffer -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer name`
bufferDelVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
bufferDelVar buffer name = makeAff $ bufferDelVar' buffer name


foreign import bufferInsert' :: forall e1 e2. Buffer -> Int -> (Array String) -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer lnum lines`
bufferInsert :: forall a. Buffer -> Int -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
bufferInsert buffer lnum lines = makeAff $ bufferInsert' buffer lnum lines


foreign import tabpageSetVar' :: forall e1 e2. Tabpage -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage name value`
tabpageSetVar :: forall a. Tabpage -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
tabpageSetVar tabpage name value = makeAff $ tabpageSetVar' tabpage name value


foreign import tabpageDelVar' :: forall e1 e2. Tabpage -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage name`
tabpageDelVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
tabpageDelVar tabpage name = makeAff $ tabpageDelVar' tabpage name


foreign import uiAttach' :: forall e1 e2. Vim -> Int -> Int -> (StrMap String) -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim width height options`
uiAttach :: forall a. Vim -> Int -> Int -> (StrMap String) -> Aff (plugin :: PLUGIN | a) Unit
uiAttach vim width height options = makeAff $ uiAttach' vim width height options


foreign import uiAttach' :: forall e1 e2. Vim -> Int -> Int -> Boolean -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim width height enable_rgb`
uiAttach :: forall a. Vim -> Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
uiAttach vim width height enable_rgb = makeAff $ uiAttach' vim width height enable_rgb


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


foreign import vimSetVar' :: forall e1 e2. Vim -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim name value`
vimSetVar :: forall a. Vim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
vimSetVar vim name value = makeAff $ vimSetVar' vim name value


foreign import vimDelVar' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim name`
vimDelVar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
vimDelVar vim name = makeAff $ vimDelVar' vim name


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


foreign import windowSetVar' :: forall e1 e2. Window -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name value`
windowSetVar :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
windowSetVar window name value = makeAff $ windowSetVar' window name value


foreign import windowDelVar' :: forall e1 e2. Window -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name`
windowDelVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
windowDelVar window name = makeAff $ windowDelVar' window name


foreign import bufferLineCount' :: forall e1 e2. Buffer -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer`
bufferLineCount :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
bufferLineCount buffer = makeAff $ bufferLineCount' buffer


foreign import bufferGetLines' :: forall e1 e2. Buffer -> Int -> Int -> Boolean -> (Error -> Eff e1 Unit) -> ((Array String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer start end strict_indexing`
bufferGetLines :: forall a. Buffer -> Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) (Array String)
bufferGetLines buffer start end strict_indexing = makeAff $ bufferGetLines' buffer start end strict_indexing


foreign import bufferSetLines' :: forall e1 e2. Buffer -> Int -> Int -> Boolean -> (Array String) -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer start end strict_indexing replacement`
bufferSetLines :: forall a. Buffer -> Int -> Int -> Boolean -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
bufferSetLines buffer start end strict_indexing replacement = makeAff $ bufferSetLines' buffer start end strict_indexing replacement


foreign import bufferGetVar' :: forall e1 e2. Buffer -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer name`
bufferGetVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
bufferGetVar buffer name = makeAff $ bufferGetVar' buffer name


foreign import bufferGetOption' :: forall e1 e2. Buffer -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer name`
bufferGetOption :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
bufferGetOption buffer name = makeAff $ bufferGetOption' buffer name


foreign import bufferSetOption' :: forall e1 e2. Buffer -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer name value`
bufferSetOption :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
bufferSetOption buffer name value = makeAff $ bufferSetOption' buffer name value


foreign import bufferGetNumber' :: forall e1 e2. Buffer -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer`
bufferGetNumber :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
bufferGetNumber buffer = makeAff $ bufferGetNumber' buffer


foreign import bufferGetName' :: forall e1 e2. Buffer -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer`
bufferGetName :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) String
bufferGetName buffer = makeAff $ bufferGetName' buffer


foreign import bufferSetName' :: forall e1 e2. Buffer -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer name`
bufferSetName :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Unit
bufferSetName buffer name = makeAff $ bufferSetName' buffer name


foreign import bufferIsValid' :: forall e1 e2. Buffer -> (Error -> Eff e1 Unit) -> (Boolean -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer`
bufferIsValid :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Boolean
bufferIsValid buffer = makeAff $ bufferIsValid' buffer


foreign import bufferGetMark' :: forall e1 e2. Buffer -> String -> (Error -> Eff e1 Unit) -> ((Array Int) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer name`
bufferGetMark :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) (Array Int)
bufferGetMark buffer name = makeAff $ bufferGetMark' buffer name


foreign import bufferAddHighlight' :: forall e1 e2. Buffer -> Int -> String -> Int -> Int -> Int -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer src_id hl_group line col_start col_end`
bufferAddHighlight :: forall a. Buffer -> Int -> String -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Int
bufferAddHighlight buffer src_id hl_group line col_start col_end = makeAff $ bufferAddHighlight' buffer src_id hl_group line col_start col_end


foreign import bufferClearHighlight' :: forall e1 e2. Buffer -> Int -> Int -> Int -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `buffer src_id line_start line_end`
bufferClearHighlight :: forall a. Buffer -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Unit
bufferClearHighlight buffer src_id line_start line_end = makeAff $ bufferClearHighlight' buffer src_id line_start line_end


foreign import tabpageGetWindows' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> ((Array Window) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage`
tabpageGetWindows :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) (Array Window)
tabpageGetWindows tabpage = makeAff $ tabpageGetWindows' tabpage


foreign import tabpageGetVar' :: forall e1 e2. Tabpage -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage name`
tabpageGetVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
tabpageGetVar tabpage name = makeAff $ tabpageGetVar' tabpage name


foreign import tabpageGetWindow' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> (Window -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage`
tabpageGetWindow :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Window
tabpageGetWindow tabpage = makeAff $ tabpageGetWindow' tabpage


foreign import tabpageIsValid' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> (Boolean -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage`
tabpageIsValid :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Boolean
tabpageIsValid tabpage = makeAff $ tabpageIsValid' tabpage


foreign import uiDetach' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
uiDetach :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Unit
uiDetach vim = makeAff $ uiDetach' vim


foreign import uiTryResize' :: forall e1 e2. Vim -> Int -> Int -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim width height`
uiTryResize :: forall a. Vim -> Int -> Int -> Aff (plugin :: PLUGIN | a) Foreign
uiTryResize vim width height = makeAff $ uiTryResize' vim width height


foreign import vimCommand' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim command`
vimCommand :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
vimCommand vim command = makeAff $ vimCommand' vim command


foreign import vimFeedkeys' :: forall e1 e2. Vim -> String -> String -> Boolean -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim keys mode escape_csi`
vimFeedkeys :: forall a. Vim -> String -> String -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
vimFeedkeys vim keys mode escape_csi = makeAff $ vimFeedkeys' vim keys mode escape_csi


foreign import vimInput' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim keys`
vimInput :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
vimInput vim keys = makeAff $ vimInput' vim keys


foreign import vimReplaceTermcodes' :: forall e1 e2. Vim -> String -> Boolean -> Boolean -> Boolean -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim str from_part do_lt special`
vimReplaceTermcodes :: forall a. Vim -> String -> Boolean -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) String
vimReplaceTermcodes vim str from_part do_lt special = makeAff $ vimReplaceTermcodes' vim str from_part do_lt special


foreign import vimCommandOutput' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim str`
vimCommandOutput :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) String
vimCommandOutput vim str = makeAff $ vimCommandOutput' vim str


foreign import vimEval' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim expr`
vimEval :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
vimEval vim expr = makeAff $ vimEval' vim expr


foreign import vimCallFunction' :: forall e1 e2. Vim -> String -> (Array Foreign) -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim fname args`
vimCallFunction :: forall a. Vim -> String -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) Foreign
vimCallFunction vim fname args = makeAff $ vimCallFunction' vim fname args


foreign import vimStrwidth' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim str`
vimStrwidth :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
vimStrwidth vim str = makeAff $ vimStrwidth' vim str


foreign import vimListRuntimePaths' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimListRuntimePaths :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array String)
vimListRuntimePaths vim = makeAff $ vimListRuntimePaths' vim


foreign import vimChangeDirectory' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim dir`
vimChangeDirectory :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
vimChangeDirectory vim dir = makeAff $ vimChangeDirectory' vim dir


foreign import vimGetCurrentLine' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (String -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimGetCurrentLine :: forall a. Vim -> Aff (plugin :: PLUGIN | a) String
vimGetCurrentLine vim = makeAff $ vimGetCurrentLine' vim


foreign import vimSetCurrentLine' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim line`
vimSetCurrentLine :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
vimSetCurrentLine vim line = makeAff $ vimSetCurrentLine' vim line


foreign import vimDelCurrentLine' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimDelCurrentLine :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Unit
vimDelCurrentLine vim = makeAff $ vimDelCurrentLine' vim


foreign import vimGetVar' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim name`
vimGetVar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
vimGetVar vim name = makeAff $ vimGetVar' vim name


foreign import vimGetVvar' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim name`
vimGetVvar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
vimGetVvar vim name = makeAff $ vimGetVvar' vim name


foreign import vimGetOption' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim name`
vimGetOption :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
vimGetOption vim name = makeAff $ vimGetOption' vim name


foreign import vimSetOption' :: forall e1 e2. Vim -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim name value`
vimSetOption :: forall a. Vim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
vimSetOption vim name value = makeAff $ vimSetOption' vim name value


foreign import vimOutWrite' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim str`
vimOutWrite :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
vimOutWrite vim str = makeAff $ vimOutWrite' vim str


foreign import vimErrWrite' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim str`
vimErrWrite :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
vimErrWrite vim str = makeAff $ vimErrWrite' vim str


foreign import vimReportError' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim str`
vimReportError :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
vimReportError vim str = makeAff $ vimReportError' vim str


foreign import vimGetBuffers' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array Buffer) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimGetBuffers :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Buffer)
vimGetBuffers vim = makeAff $ vimGetBuffers' vim


foreign import vimGetCurrentBuffer' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Buffer -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimGetCurrentBuffer :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Buffer
vimGetCurrentBuffer vim = makeAff $ vimGetCurrentBuffer' vim


foreign import vimSetCurrentBuffer' :: forall e1 e2. Vim -> Buffer -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim buffer`
vimSetCurrentBuffer :: forall a. Vim -> Buffer -> Aff (plugin :: PLUGIN | a) Unit
vimSetCurrentBuffer vim buffer = makeAff $ vimSetCurrentBuffer' vim buffer


foreign import vimGetWindows' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array Window) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimGetWindows :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Window)
vimGetWindows vim = makeAff $ vimGetWindows' vim


foreign import vimGetCurrentWindow' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Window -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimGetCurrentWindow :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Window
vimGetCurrentWindow vim = makeAff $ vimGetCurrentWindow' vim


foreign import vimSetCurrentWindow' :: forall e1 e2. Vim -> Window -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim window`
vimSetCurrentWindow :: forall a. Vim -> Window -> Aff (plugin :: PLUGIN | a) Unit
vimSetCurrentWindow vim window = makeAff $ vimSetCurrentWindow' vim window


foreign import vimGetTabpages' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array Tabpage) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimGetTabpages :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Tabpage)
vimGetTabpages vim = makeAff $ vimGetTabpages' vim


foreign import vimGetCurrentTabpage' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Tabpage -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimGetCurrentTabpage :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Tabpage
vimGetCurrentTabpage vim = makeAff $ vimGetCurrentTabpage' vim


foreign import vimSetCurrentTabpage' :: forall e1 e2. Vim -> Tabpage -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim tabpage`
vimSetCurrentTabpage :: forall a. Vim -> Tabpage -> Aff (plugin :: PLUGIN | a) Unit
vimSetCurrentTabpage vim tabpage = makeAff $ vimSetCurrentTabpage' vim tabpage


foreign import vimSubscribe' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim event`
vimSubscribe :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
vimSubscribe vim event = makeAff $ vimSubscribe' vim event


foreign import vimUnsubscribe' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim event`
vimUnsubscribe :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
vimUnsubscribe vim event = makeAff $ vimUnsubscribe' vim event


foreign import vimNameToColor' :: forall e1 e2. Vim -> String -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim name`
vimNameToColor :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
vimNameToColor vim name = makeAff $ vimNameToColor' vim name


foreign import vimGetColorMap' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((StrMap String) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimGetColorMap :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (StrMap String)
vimGetColorMap vim = makeAff $ vimGetColorMap' vim


foreign import vimGetApiInfo' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> ((Array Foreign) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `vim`
vimGetApiInfo :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Foreign)
vimGetApiInfo vim = makeAff $ vimGetApiInfo' vim


foreign import windowGetBuffer' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Buffer -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
windowGetBuffer :: forall a. Window -> Aff (plugin :: PLUGIN | a) Buffer
windowGetBuffer window = makeAff $ windowGetBuffer' window


foreign import windowGetCursor' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> ((Array Int) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
windowGetCursor :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
windowGetCursor window = makeAff $ windowGetCursor' window


foreign import windowSetCursor' :: forall e1 e2. Window -> (Array Int) -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window pos`
windowSetCursor :: forall a. Window -> (Array Int) -> Aff (plugin :: PLUGIN | a) Unit
windowSetCursor window pos = makeAff $ windowSetCursor' window pos


foreign import windowGetHeight' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
windowGetHeight :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
windowGetHeight window = makeAff $ windowGetHeight' window


foreign import windowSetHeight' :: forall e1 e2. Window -> Int -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window height`
windowSetHeight :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
windowSetHeight window height = makeAff $ windowSetHeight' window height


foreign import windowGetWidth' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
windowGetWidth :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
windowGetWidth window = makeAff $ windowGetWidth' window


foreign import windowSetWidth' :: forall e1 e2. Window -> Int -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window width`
windowSetWidth :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
windowSetWidth window width = makeAff $ windowSetWidth' window width


foreign import windowGetVar' :: forall e1 e2. Window -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name`
windowGetVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
windowGetVar window name = makeAff $ windowGetVar' window name


foreign import windowGetOption' :: forall e1 e2. Window -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name`
windowGetOption :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
windowGetOption window name = makeAff $ windowGetOption' window name


foreign import windowSetOption' :: forall e1 e2. Window -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name value`
windowSetOption :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
windowSetOption window name value = makeAff $ windowSetOption' window name value


foreign import windowGetPosition' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> ((Array Int) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
windowGetPosition :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
windowGetPosition window = makeAff $ windowGetPosition' window


foreign import windowGetTabpage' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Tabpage -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
windowGetTabpage :: forall a. Window -> Aff (plugin :: PLUGIN | a) Tabpage
windowGetTabpage window = makeAff $ windowGetTabpage' window


foreign import windowIsValid' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Boolean -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
windowIsValid :: forall a. Window -> Aff (plugin :: PLUGIN | a) Boolean
windowIsValid window = makeAff $ windowIsValid' window


