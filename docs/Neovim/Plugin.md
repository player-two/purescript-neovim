## Module Neovim.Plugin

#### `PLUGIN`

``` purescript
data PLUGIN :: !
```

The `PLUGIN` effect is used for all interactions with the Neovim process
via the messagepack rpc api.

#### `debug`

``` purescript
debug :: forall a e. a -> Aff (plugin :: PLUGIN | e) Unit
```

#### `Args`

``` purescript
type Args = Array String
```

An alias for the arguments passed to a `CommandHandler` or `FunctionHandler`.

#### `Opts`

``` purescript
type Opts = StrMap String
```

An alias for the options passed to a `CommandHandler` or `AutocmdHandler`.

#### `Range`

``` purescript
type Range = Array Int
```

An alias for the range of lines passed to a `CommandHandler`.

#### `defaultOpts`

``` purescript
defaultOpts :: Opts
```

Sensible defaults for a command or autocmd

#### `command`

``` purescript
command :: forall e. String -> Opts -> (Nvim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit) -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim command.

#### `commandSync`

``` purescript
commandSync :: forall e. String -> Opts -> (Nvim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit) -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim command that will block until it completes.

#### `autocmd`

``` purescript
autocmd :: forall e. String -> Opts -> (Nvim -> String -> Aff (plugin :: PLUGIN | e) Unit) -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim autocmd.

#### `autocmdSync`

``` purescript
autocmdSync :: forall e. String -> Opts -> (Nvim -> String -> Aff (plugin :: PLUGIN | e) Unit) -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim autocmd that will block until it completes.

#### `function`

``` purescript
function :: forall e. String -> (Nvim -> Args -> Aff (plugin :: PLUGIN | e) Unit) -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim function.

#### `functionSync`

``` purescript
functionSync :: forall e. String -> (Nvim -> Args -> Aff (plugin :: PLUGIN | e) Unit) -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim function that will block until it completes.


