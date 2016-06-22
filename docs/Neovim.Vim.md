## Module Neovim.Vim

#### `command`

``` purescript
command :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `feedkeys`

``` purescript
feedkeys :: forall a. Vim -> String -> String -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
```

#### `input`

``` purescript
input :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
```

#### `replaceTermcodes`

``` purescript
replaceTermcodes :: forall a. Vim -> String -> Boolean -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) String
```

#### `commandOutput`

``` purescript
commandOutput :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) String
```

#### `eval`

``` purescript
eval :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `callFunction`

``` purescript
callFunction :: forall a. Vim -> String -> (Array Foreign) -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `strwidth`

``` purescript
strwidth :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
```

#### `listRuntimePaths`

``` purescript
listRuntimePaths :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array String)
```

#### `changeDirectory`

``` purescript
changeDirectory :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getCurrentLine`

``` purescript
getCurrentLine :: forall a. Vim -> Aff (plugin :: PLUGIN | a) String
```

#### `setCurrentLine`

``` purescript
setCurrentLine :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `delCurrentLine`

``` purescript
delCurrentLine :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getVar`

``` purescript
getVar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `setVar`

``` purescript
setVar :: forall a. Vim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `delVar`

``` purescript
delVar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `getVvar`

``` purescript
getVvar :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `getOption`

``` purescript
getOption :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `setOption`

``` purescript
setOption :: forall a. Vim -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

#### `outWrite`

``` purescript
outWrite :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `errWrite`

``` purescript
errWrite :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `reportError`

``` purescript
reportError :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getBuffers`

``` purescript
getBuffers :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Buffer)
```

#### `getCurrentBuffer`

``` purescript
getCurrentBuffer :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Buffer
```

#### `setCurrentBuffer`

``` purescript
setCurrentBuffer :: forall a. Vim -> Buffer -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getWindows`

``` purescript
getWindows :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Window)
```

#### `getCurrentWindow`

``` purescript
getCurrentWindow :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Window
```

#### `setCurrentWindow`

``` purescript
setCurrentWindow :: forall a. Vim -> Window -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getTabpages`

``` purescript
getTabpages :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Tabpage)
```

#### `getCurrentTabpage`

``` purescript
getCurrentTabpage :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Tabpage
```

#### `setCurrentTabpage`

``` purescript
setCurrentTabpage :: forall a. Vim -> Tabpage -> Aff (plugin :: PLUGIN | a) Unit
```

#### `subscribe`

``` purescript
subscribe :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `unsubscribe`

``` purescript
unsubscribe :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `nameToColor`

``` purescript
nameToColor :: forall a. Vim -> String -> Aff (plugin :: PLUGIN | a) Int
```

#### `getColorMap`

``` purescript
getColorMap :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (StrMap String)
```

#### `getApiInfo`

``` purescript
getApiInfo :: forall a. Vim -> Aff (plugin :: PLUGIN | a) (Array Foreign)
```


