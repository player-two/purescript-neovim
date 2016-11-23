## Module Neovim.Tabpage

#### `setVar`

``` purescript
setVar :: forall a. Tabpage -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `tabpage name value`

#### `delVar`

``` purescript
delVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `tabpage name`

#### `getWindows`

``` purescript
getWindows :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) (Array Window)
```

args: `tabpage`

#### `getVar`

``` purescript
getVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `tabpage name`

#### `getWindow`

``` purescript
getWindow :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Window
```

args: `tabpage`

#### `isValid`

``` purescript
isValid :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Boolean
```

args: `tabpage`


