## Module Neovim.Window

#### `getBuf`

``` purescript
getBuf :: forall a. Window -> Aff (plugin :: PLUGIN | a) Buffer
```

args: `window`

#### `getCursor`

``` purescript
getCursor :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
```

args: `window`

#### `setCursor`

``` purescript
setCursor :: forall a. Window -> (Array Int) -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window pos`

#### `getHeight`

``` purescript
getHeight :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
```

args: `window`

#### `setHeight`

``` purescript
setHeight :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window height`

#### `getWidth`

``` purescript
getWidth :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
```

args: `window`

#### `setWidth`

``` purescript
setWidth :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window width`

#### `getVar`

``` purescript
getVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `window name`

#### `setVar`

``` purescript
setVar :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window name value`

#### `delVar`

``` purescript
delVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window name`

#### `getOption`

``` purescript
getOption :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `window name`

#### `setOption`

``` purescript
setOption :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `window name value`

#### `getPosition`

``` purescript
getPosition :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
```

args: `window`

#### `getTabpage`

``` purescript
getTabpage :: forall a. Window -> Aff (plugin :: PLUGIN | a) Tabpage
```

args: `window`

#### `getNumber`

``` purescript
getNumber :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
```

args: `window`

#### `isValid`

``` purescript
isValid :: forall a. Window -> Aff (plugin :: PLUGIN | a) Boolean
```

args: `window`


