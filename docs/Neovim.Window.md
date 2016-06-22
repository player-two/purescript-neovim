## Module Neovim.Window

#### `getBuffer`

``` purescript
getBuffer :: forall a. Window -> Aff (plugin :: PLUGIN | a) Buffer
```

#### `getCursor`

``` purescript
getCursor :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
```

#### `setCursor`

``` purescript
setCursor :: forall a. Window -> (Array Int) -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getHeight`

``` purescript
getHeight :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
```

#### `setHeight`

``` purescript
setHeight :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getWidth`

``` purescript
getWidth :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
```

#### `setWidth`

``` purescript
setWidth :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getVar`

``` purescript
getVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `setVar`

``` purescript
setVar :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `delVar`

``` purescript
delVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `getOption`

``` purescript
getOption :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `setOption`

``` purescript
setOption :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getPosition`

``` purescript
getPosition :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
```

#### `getTabpage`

``` purescript
getTabpage :: forall a. Window -> Aff (plugin :: PLUGIN | a) Tabpage
```

#### `isValid`

``` purescript
isValid :: forall a. Window -> Aff (plugin :: PLUGIN | a) Boolean
```


