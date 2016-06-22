## Module Neovim.Buffer

#### `lineCount`

``` purescript
lineCount :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
```

#### `getLine`

``` purescript
getLine :: forall a. Buffer -> Int -> Aff (plugin :: PLUGIN | a) String
```

#### `setLine`

``` purescript
setLine :: forall a. Buffer -> Int -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `delLine`

``` purescript
delLine :: forall a. Buffer -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getLineSlice`

``` purescript
getLineSlice :: forall a. Buffer -> Int -> Int -> Boolean -> Boolean -> Aff (plugin :: PLUGIN | a) (Array String)
```

#### `getLines`

``` purescript
getLines :: forall a. Buffer -> Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) (Array String)
```

#### `setLineSlice`

``` purescript
setLineSlice :: forall a. Buffer -> Int -> Int -> Boolean -> Boolean -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
```

#### `setLines`

``` purescript
setLines :: forall a. Buffer -> Int -> Int -> Boolean -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getVar`

``` purescript
getVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `setVar`

``` purescript
setVar :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `delVar`

``` purescript
delVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `getOption`

``` purescript
getOption :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

#### `setOption`

``` purescript
setOption :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getNumber`

``` purescript
getNumber :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
```

#### `getName`

``` purescript
getName :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) String
```

#### `setName`

``` purescript
setName :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Unit
```

#### `isValid`

``` purescript
isValid :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Boolean
```

#### `insert`

``` purescript
insert :: forall a. Buffer -> Int -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
```

#### `getMark`

``` purescript
getMark :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) (Array Int)
```

#### `addHighlight`

``` purescript
addHighlight :: forall a. Buffer -> Int -> String -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Int
```

#### `clearHighlight`

``` purescript
clearHighlight :: forall a. Buffer -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Unit
```


