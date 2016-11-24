## Module Neovim.Buffer

#### `lineCount`

``` purescript
lineCount :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
```

args: `buffer`

#### `getLines`

``` purescript
getLines :: forall a. Buffer -> Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) (Array String)
```

args: `buffer start end strict_indexing`

#### `setLines`

``` purescript
setLines :: forall a. Buffer -> Int -> Int -> Boolean -> (Array String) -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer start end strict_indexing replacement`

#### `getVar`

``` purescript
getVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `buffer name`

#### `setVar`

``` purescript
setVar :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer name value`

#### `delVar`

``` purescript
delVar :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer name`

#### `getOption`

``` purescript
getOption :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `buffer name`

#### `setOption`

``` purescript
setOption :: forall a. Buffer -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer name value`

#### `getNumber`

``` purescript
getNumber :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Int
```

args: `buffer`

#### `getName`

``` purescript
getName :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) String
```

args: `buffer`

#### `setName`

``` purescript
setName :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer name`

#### `isValid`

``` purescript
isValid :: forall a. Buffer -> Aff (plugin :: PLUGIN | a) Boolean
```

args: `buffer`

#### `getMark`

``` purescript
getMark :: forall a. Buffer -> String -> Aff (plugin :: PLUGIN | a) (Array Int)
```

args: `buffer name`

#### `addHighlight`

``` purescript
addHighlight :: forall a. Buffer -> Int -> String -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Int
```

args: `buffer src_id hl_group line col_start col_end`

#### `clearHighlight`

``` purescript
clearHighlight :: forall a. Buffer -> Int -> Int -> Int -> Aff (plugin :: PLUGIN | a) Unit
```

args: `buffer src_id line_start line_end`


