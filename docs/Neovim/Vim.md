## Module Neovim.Vim

#### `setVar`

``` purescript
setVar :: forall a. Vim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `vim name value`

#### `delVar`

``` purescript
delVar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `vim name`

#### `command`

``` purescript
command :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim command`

#### `feedkeys`

``` purescript
feedkeys :: forall a. Vim -> String -> String -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim keys mode escape_csi`

#### `input`

``` purescript
input :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
```

args: `vim keys`

#### `replaceTermcodes`

``` purescript
replaceTermcodes :: forall a. Vim -> String -> Boolean -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) String
```

args: `vim str from_part do_lt special`

#### `commandOutput`

``` purescript
commandOutput :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) String
```

args: `vim str`

#### `eval`

``` purescript
eval :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `vim expr`

#### `callFunction`

``` purescript
callFunction :: forall a. Vim -> String -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `vim fname args`

#### `strwidth`

``` purescript
strwidth :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
```

args: `vim str`

#### `listRuntimePaths`

``` purescript
listRuntimePaths :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array String)
```

args: `vim`

#### `changeDirectory`

``` purescript
changeDirectory :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim dir`

#### `getCurrentLine`

``` purescript
getCurrentLine :: forall a. Vim -> Aff (plugin :: PLUGIN | a) String
```

args: `vim`

#### `setCurrentLine`

``` purescript
setCurrentLine :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim line`

#### `delCurrentLine`

``` purescript
delCurrentLine :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim`

#### `getVar`

``` purescript
getVar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `vim name`

#### `getVvar`

``` purescript
getVvar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `vim name`

#### `getOption`

``` purescript
getOption :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `vim name`

#### `setOption`

``` purescript
setOption :: forall a. Vim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim name value`

#### `outWrite`

``` purescript
outWrite :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim str`

#### `errWrite`

``` purescript
errWrite :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim str`

#### `reportError`

``` purescript
reportError :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim str`

#### `getBuffers`

``` purescript
getBuffers :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Buffer)
```

args: `vim`

#### `getCurrentBuffer`

``` purescript
getCurrentBuffer :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Buffer
```

args: `vim`

#### `setCurrentBuffer`

``` purescript
setCurrentBuffer :: forall a. Vim -> Buffer -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim buffer`

#### `getWindows`

``` purescript
getWindows :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Window)
```

args: `vim`

#### `getCurrentWindow`

``` purescript
getCurrentWindow :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Window
```

args: `vim`

#### `setCurrentWindow`

``` purescript
setCurrentWindow :: forall a. Vim -> Window -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim window`

#### `getTabpages`

``` purescript
getTabpages :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Tabpage)
```

args: `vim`

#### `getCurrentTabpage`

``` purescript
getCurrentTabpage :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Tabpage
```

args: `vim`

#### `setCurrentTabpage`

``` purescript
setCurrentTabpage :: forall a. Vim -> Tabpage -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim tabpage`

#### `subscribe`

``` purescript
subscribe :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim event`

#### `unsubscribe`

``` purescript
unsubscribe :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim event`

#### `nameToColor`

``` purescript
nameToColor :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
```

args: `vim name`

#### `getColorMap`

``` purescript
getColorMap :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (StrMap String)
```

args: `vim`

#### `getApiInfo`

``` purescript
getApiInfo :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Foreign)
```

args: `vim`


