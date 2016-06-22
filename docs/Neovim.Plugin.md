## Module Neovim.Plugin

#### `PLUGIN`

``` purescript
data PLUGIN :: !
```

The `PLUGIN` effect is used for all interactions with the Neovim process
via the messagepack rpc api.

#### `debug`

``` purescript
debug :: forall a e. a -> Eff (plugin :: PLUGIN | e) Unit
```

The debug function will print any value to the file defined by
the `$NEOVIM_JS_DEBUG` environment variable.

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

#### `CommandHandler`

``` purescript
type CommandHandler = forall e. Vim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit
```

The implementation of a command
The `Args` are simply a list of the args for the command, so evaluating
`:MyCommand foo bar` will correspond to `["foo", "bar"]`.
The `Range` is always a list of two `Int`s representing the range of lines
that the command applies to.  So for `:12,25MyCommand`, the range is `[12, 25]`.
When the command only applies to one line, that line number is repeated.

#### `command`

``` purescript
command :: forall e. String -> Opts -> CommandHandler -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim command.

#### `commandSync`

``` purescript
commandSync :: forall e. String -> Opts -> CommandHandler -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim command that will block until it completes.

#### `AutocmdHandler`

``` purescript
type AutocmdHandler = forall e. Vim -> String -> Aff (plugin :: PLUGIN | e) Unit
```

The implementation of an autocmd
The second argument is the filename corresponding the the buffer the event was triggered on.

#### `autocmd`

``` purescript
autocmd :: forall e. String -> Opts -> AutocmdHandler -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim autocmd.

#### `autocmdSync`

``` purescript
autocmdSync :: forall e. String -> Opts -> AutocmdHandler -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim autocmd that will block until it completes.

#### `FunctionHandler`

``` purescript
type FunctionHandler = forall e. Vim -> Args -> Aff (plugin :: PLUGIN | e) Unit
```

#### `function`

``` purescript
function :: forall e. String -> FunctionHandler -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim function.

#### `functionSync`

``` purescript
functionSync :: forall e. String -> FunctionHandler -> Eff (plugin :: PLUGIN | e) Unit
```

Define a new Neovim function that will block until it completes.


