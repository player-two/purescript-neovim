## Module Neovim.Nvim

#### `uiAttach`

``` purescript
uiAttach :: forall a. Nvim -> Int -> Int -> (StrMap String) -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim width height options`

#### `uiDetach`

``` purescript
uiDetach :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim`

#### `uiTryResize`

``` purescript
uiTryResize :: forall a. Nvim -> Int -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim width height`

#### `uiSetOption`

``` purescript
uiSetOption :: forall a. Nvim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim name value`

#### `command`

``` purescript
command :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim command`

#### `feedkeys`

``` purescript
feedkeys :: forall a. Nvim -> String -> String -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim keys mode escape_csi`

#### `input`

``` purescript
input :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Int
```

args: `nvim keys`

#### `replaceTermcodes`

``` purescript
replaceTermcodes :: forall a. Nvim -> String -> Boolean -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) String
```

args: `nvim str from_part do_lt special`

#### `commandOutput`

``` purescript
commandOutput :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) String
```

args: `nvim str`

#### `eval`

``` purescript
eval :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `nvim expr`

#### `callFunction`

``` purescript
callFunction :: forall a. Nvim -> String -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `nvim fname args`

#### `strwidth`

``` purescript
strwidth :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Int
```

args: `nvim str`

#### `listRuntimePaths`

``` purescript
listRuntimePaths :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array String)
```

args: `nvim`

#### `setCurrentDir`

``` purescript
setCurrentDir :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim dir`

#### `getCurrentLine`

``` purescript
getCurrentLine :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) String
```

args: `nvim`

#### `setCurrentLine`

``` purescript
setCurrentLine :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim line`

#### `delCurrentLine`

``` purescript
delCurrentLine :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim`

#### `getVar`

``` purescript
getVar :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `nvim name`

#### `setVar`

``` purescript
setVar :: forall a. Nvim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim name value`

#### `delVar`

``` purescript
delVar :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim name`

#### `getVvar`

``` purescript
getVvar :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `nvim name`

#### `getOption`

``` purescript
getOption :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `nvim name`

#### `setOption`

``` purescript
setOption :: forall a. Nvim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim name value`

#### `outWrite`

``` purescript
outWrite :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim str`

#### `errWrite`

``` purescript
errWrite :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim str`

#### `errWriteln`

``` purescript
errWriteln :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim str`

#### `listBufs`

``` purescript
listBufs :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array Buffer)
```

args: `nvim`

#### `getCurrentBuf`

``` purescript
getCurrentBuf :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Buffer
```

args: `nvim`

#### `setCurrentBuf`

``` purescript
setCurrentBuf :: forall a. Nvim -> Buffer -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim buffer`

#### `listWins`

``` purescript
listWins :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array Window)
```

args: `nvim`

#### `getCurrentWin`

``` purescript
getCurrentWin :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Window
```

args: `nvim`

#### `setCurrentWin`

``` purescript
setCurrentWin :: forall a. Nvim -> Window -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim window`

#### `listTabpages`

``` purescript
listTabpages :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array Tabpage)
```

args: `nvim`

#### `getCurrentTabpage`

``` purescript
getCurrentTabpage :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) Tabpage
```

args: `nvim`

#### `setCurrentTabpage`

``` purescript
setCurrentTabpage :: forall a. Nvim -> Tabpage -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim tabpage`

#### `subscribe`

``` purescript
subscribe :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim event`

#### `unsubscribe`

``` purescript
unsubscribe :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `nvim event`

#### `getColorByName`

``` purescript
getColorByName :: forall a. Nvim -> String -> Aff (plugin :: PLUGIN | a) Int
```

args: `nvim name`

#### `getColorMap`

``` purescript
getColorMap :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (StrMap String)
```

args: `nvim`

#### `getApiInfo`

``` purescript
getApiInfo :: forall a. Nvim -> Aff (plugin :: PLUGIN | a) (Array Foreign)
```

args: `nvim`

#### `callAtomic`

``` purescript
callAtomic :: forall a. Nvim -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) (Array Foreign)
```

args: `nvim calls`


