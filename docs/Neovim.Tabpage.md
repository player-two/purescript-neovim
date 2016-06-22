## Module Neovim.Tabpage

#### `getWindows`

``` purescript
getWindows :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) (Array Window)
```

#### `getVar`

``` purescript
getVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `setVar`

``` purescript
setVar :: forall a. Tabpage -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `delVar`

``` purescript
delVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `getWindow`

``` purescript
getWindow :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Window
```

#### `isValid`

``` purescript
isValid :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Boolean
```


