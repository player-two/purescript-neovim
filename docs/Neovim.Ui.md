## Module Neovim.Ui

#### `attach`

``` purescript
attach :: forall a. Vim -> Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
```

#### `detach`

``` purescript
detach :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Unit
```

#### `tryResize`

``` purescript
tryResize :: forall a. Vim -> Int -> Int -> Aff (plugin :: PLUGIN | a) Foreign
```


