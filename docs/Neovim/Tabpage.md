## Module Neovim.Tabpage

#### `listWins`

``` purescript
listWins :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) (Array Window)
```

args: `tabpage`

#### `getVar`

``` purescript
getVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `tabpage name`

#### `setVar`

``` purescript
setVar :: forall a. Tabpage -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `tabpage name value`

#### `delVar`

``` purescript
delVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `tabpage name`

#### `getWin`

``` purescript
getWin :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Window
```

args: `tabpage`

#### `getNumber`

``` purescript
getNumber :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Int
```

args: `tabpage`

#### `isValid`

``` purescript
isValid :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Boolean
```

args: `tabpage`


