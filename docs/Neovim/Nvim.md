## Module Neovim.Nvim

#### `bufLineCount`

``` purescript
bufLineCount :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
```

args: `buffer`

#### `bufGetLines`

``` purescript
bufGetLines :: forall a. Buffer -> Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) (Array String)
```

args: `buffer start end strict_indexing`

#### `bufSetLines`

``` purescript
bufSetLines :: forall a. Buffer -> Int -> Int -> Boolean -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer start end strict_indexing replacement`

#### `bufGetVar`

``` purescript
bufGetVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `buffer name`

#### `bufSetVar`

``` purescript
bufSetVar :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer name value`

#### `bufDelVar`

``` purescript
bufDelVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer name`

#### `bufGetOption`

``` purescript
bufGetOption :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `buffer name`

#### `bufSetOption`

``` purescript
bufSetOption :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer name value`

#### `bufGetNumber`

``` purescript
bufGetNumber :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
```

args: `buffer`

#### `bufGetName`

``` purescript
bufGetName :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) String
```

args: `buffer`

#### `bufSetName`

``` purescript
bufSetName :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer name`

#### `bufIsValid`

``` purescript
bufIsValid :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Boolean
```

args: `buffer`

#### `bufGetMark`

``` purescript
bufGetMark :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) (Array Int)
```

args: `buffer name`

#### `bufAddHighlight`

``` purescript
bufAddHighlight :: forall a. Buffer -> Int -> String -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Int
```

args: `buffer src_id hl_group line col_start col_end`

#### `bufClearHighlight`

``` purescript
bufClearHighlight :: forall a. Buffer -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer src_id line_start line_end`

#### `tabpageListWins`

``` purescript
tabpageListWins :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) (Array Window)
```

args: `tabpage`

#### `tabpageGetVar`

``` purescript
tabpageGetVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `tabpage name`

#### `tabpageSetVar`

``` purescript
tabpageSetVar :: forall a. Tabpage -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `tabpage name value`

#### `tabpageDelVar`

``` purescript
tabpageDelVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `tabpage name`

#### `tabpageGetWin`

``` purescript
tabpageGetWin :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Window
```

args: `tabpage`

#### `tabpageGetNumber`

``` purescript
tabpageGetNumber :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Int
```

args: `tabpage`

#### `tabpageIsValid`

``` purescript
tabpageIsValid :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Boolean
```

args: `tabpage`

#### `uiAttach`

``` purescript
uiAttach :: forall a. Int -> Int -> (StrMap String) -> Aff (plugin :: PLUGIN | a) Unit
```

args: `width height options`

#### `uiDetach`

``` purescript
uiDetach :: forall a. Aff (plugin :: PLUGIN | a) Unit
```

args: ``

#### `uiTryResize`

``` purescript
uiTryResize :: forall a. Int -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

args: `width height`

#### `uiSetOption`

``` purescript
uiSetOption :: forall a. String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `name value`

#### `command`

``` purescript
command :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `command`

#### `feedkeys`

``` purescript
feedkeys :: forall a. String -> String -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
```

args: `keys mode escape_csi`

#### `input`

``` purescript
input :: forall a. String -> Aff (plugin :: PLUGIN | a) Int
```

args: `keys`

#### `replaceTermcodes`

``` purescript
replaceTermcodes :: forall a. String -> Boolean -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) String
```

args: `str from_part do_lt special`

#### `commandOutput`

``` purescript
commandOutput :: forall a. String -> Aff (plugin :: PLUGIN | a) String
```

args: `str`

#### `eval`

``` purescript
eval :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `expr`

#### `callFunction`

``` purescript
callFunction :: forall a. String -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `fname args`

#### `strwidth`

``` purescript
strwidth :: forall a. String -> Aff (plugin :: PLUGIN | a) Int
```

args: `str`

#### `listRuntimePaths`

``` purescript
listRuntimePaths :: forall a. Aff (plugin :: PLUGIN | a) (Array String)
```

args: ``

#### `setCurrentDir`

``` purescript
setCurrentDir :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `dir`

#### `getCurrentLine`

``` purescript
getCurrentLine :: forall a. Aff (plugin :: PLUGIN | a) String
```

args: ``

#### `setCurrentLine`

``` purescript
setCurrentLine :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `line`

#### `delCurrentLine`

``` purescript
delCurrentLine :: forall a. Aff (plugin :: PLUGIN | a) Unit
```

args: ``

#### `getVar`

``` purescript
getVar :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `name`

#### `setVar`

``` purescript
setVar :: forall a. String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `name value`

#### `delVar`

``` purescript
delVar :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `name`

#### `getVvar`

``` purescript
getVvar :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `name`

#### `getOption`

``` purescript
getOption :: forall a. String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `name`

#### `setOption`

``` purescript
setOption :: forall a. String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `name value`

#### `outWrite`

``` purescript
outWrite :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `str`

#### `errWrite`

``` purescript
errWrite :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `str`

#### `errWriteln`

``` purescript
errWriteln :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `str`

#### `listBufs`

``` purescript
listBufs :: forall a. Aff (plugin :: PLUGIN | a) (Array Buffer)
```

args: ``

#### `getCurrentBuf`

``` purescript
getCurrentBuf :: forall a. Aff (plugin :: PLUGIN | a) Buffer
```

args: ``

#### `setCurrentBuf`

``` purescript
setCurrentBuf :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer`

#### `listWins`

``` purescript
listWins :: forall a. Aff (plugin :: PLUGIN | a) (Array Window)
```

args: ``

#### `getCurrentWin`

``` purescript
getCurrentWin :: forall a. Aff (plugin :: PLUGIN | a) Window
```

args: ``

#### `setCurrentWin`

``` purescript
setCurrentWin :: forall a. Window -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window`

#### `listTabpages`

``` purescript
listTabpages :: forall a. Aff (plugin :: PLUGIN | a) (Array Tabpage)
```

args: ``

#### `getCurrentTabpage`

``` purescript
getCurrentTabpage :: forall a. Aff (plugin :: PLUGIN | a) Tabpage
```

args: ``

#### `setCurrentTabpage`

``` purescript
setCurrentTabpage :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Unit
```

args: `tabpage`

#### `subscribe`

``` purescript
subscribe :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `event`

#### `unsubscribe`

``` purescript
unsubscribe :: forall a. String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `event`

#### `getColorByName`

``` purescript
getColorByName :: forall a. String -> Aff (plugin :: PLUGIN | a) Int
```

args: `name`

#### `getColorMap`

``` purescript
getColorMap :: forall a. Aff (plugin :: PLUGIN | a) (StrMap String)
```

args: ``

#### `getApiInfo`

``` purescript
getApiInfo :: forall a. Aff (plugin :: PLUGIN | a) (Array Foreign)
```

args: ``

#### `callAtomic`

``` purescript
callAtomic :: forall a. (Array Foreign) -> Aff (plugin :: PLUGIN | a) (Array Foreign)
```

args: `calls`

#### `winGetBuf`

``` purescript
winGetBuf :: forall a. Window -> Aff (plugin :: PLUGIN | a) Buffer
```

args: `window`

#### `winGetCursor`

``` purescript
winGetCursor :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
```

args: `window`

#### `winSetCursor`

``` purescript
winSetCursor :: forall a. Window -> (Array Int) -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window pos`

#### `winGetHeight`

``` purescript
winGetHeight :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
```

args: `window`

#### `winSetHeight`

``` purescript
winSetHeight :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window height`

#### `winGetWidth`

``` purescript
winGetWidth :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
```

args: `window`

#### `winSetWidth`

``` purescript
winSetWidth :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window width`

#### `winGetVar`

``` purescript
winGetVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `window name`

#### `winSetVar`

``` purescript
winSetVar :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window name value`

#### `winDelVar`

``` purescript
winDelVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window name`

#### `winGetOption`

``` purescript
winGetOption :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `window name`

#### `winSetOption`

``` purescript
winSetOption :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window name value`

#### `winGetPosition`

``` purescript
winGetPosition :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
```

args: `window`

#### `winGetTabpage`

``` purescript
winGetTabpage :: forall a. Window -> Aff (plugin :: PLUGIN | a) Tabpage
```

args: `window`

#### `winGetNumber`

``` purescript
winGetNumber :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
```

args: `window`

#### `winIsValid`

``` purescript
winIsValid :: forall a. Window -> Aff (plugin :: PLUGIN | a) Boolean
```

args: `window`


