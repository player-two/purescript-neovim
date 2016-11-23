## Module Neovim.Ui

#### `attach`

``` purescript
attach :: forall a. Vim -> Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim width height enable_rgb`

#### `detach`

``` purescript
detach :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Unit
```

args: `vim`

#### `tryResize`

``` purescript
tryResize :: forall a. Vim -> Int -> Int -> Aff (plugin :: PLUGIN | a) Foreign
```

args: `vim width height`


