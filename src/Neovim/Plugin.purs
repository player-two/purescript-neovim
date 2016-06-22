module Neovim.Plugin
  ( autocmd
  , autocmdSync
  , command
  , commandSync
  , debug
  , defaultOpts
  , function
  , functionSync
  , Args
  , AutocmdHandler
  , CommandHandler
  , FunctionHandler
  , Opts
  , Range
  , PLUGIN
  ) where

import Prelude
import Control.Monad.Aff (runAff, Aff)
import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (toNullable)
import Data.StrMap (insert, singleton, StrMap)

import Neovim.Types (Vim)

-- | The `PLUGIN` effect is used for all interactions with the Neovim process
-- | via the messagepack rpc api.
foreign import data PLUGIN :: !


-- | The debug function will print any value to the file defined by
-- | the `$NEOVIM_JS_DEBUG` environment variable.
foreign import debug :: forall a e. a -> Eff (plugin :: PLUGIN | e) Unit


compose12 :: forall a b c d. (c -> d) -> (a -> b -> c) -> a -> b -> d
compose12 f g a = f <<< g a

compose13 :: forall a b c d e. (d -> e) -> (a -> b -> c -> d) -> a -> b -> c -> e
compose13 f g a = compose12 f (g a)


-- | An alias for the arguments passed to a `CommandHandler` or `FunctionHandler`.
type Args = Array String

-- | An alias for the options passed to a `CommandHandler` or `AutocmdHandler`.
type Opts = StrMap String

-- | An alias for the range of lines passed to a `CommandHandler`.
type Range = Array Int

-- | Sensible defaults for a command or autocmd
defaultOpts :: Opts
defaultOpts = insert "nargs" "*" (singleton "range" "")

-- | This defines the type for the function that the node-client passes to a sync handler to
-- | notify neovim that the handler has finished it's computation.
-- | `Done` should return an effect, but it is passed to Purescript as an argument from an FFI that cannot be changed.
-- | Always use `wrapDone` to curry the foreign function and make it return an effect.
type Done = forall a b. a -> b -> Unit
foreign import wrapDone :: forall a b e. Done -> a -> b -> Eff (plugin :: PLUGIN | e) Unit

ignore :: forall a e. Eff e a -> Eff e Unit
ignore = (_ >>= \_ -> pure unit)

runHandler :: forall a e. Aff (plugin :: PLUGIN | e) a -> Eff (plugin :: PLUGIN | e) Unit
runHandler = ignore <<< runAff debug debug

runHandlerSync :: forall a e. Done -> Aff (plugin :: PLUGIN | e) a -> Eff (plugin :: PLUGIN | e) Unit
runHandlerSync done = ignore <<< runAff (flip (wrapDone done) null) (wrapDone done null)
  where null = toNullable Nothing

runHandlerSync' :: forall a e. Aff (plugin :: PLUGIN | e) a -> Done -> Eff (plugin :: PLUGIN | e) Unit
runHandlerSync' aff done = ignore $ runAff (flip (wrapDone done) null) (wrapDone done null) aff
  where null = toNullable Nothing

-- | The implementation of a command
-- | The `Args` are simply a list of the args for the command, so evaluating
-- | `:MyCommand foo bar` will correspond to `["foo", "bar"]`.
-- | The `Range` is always a list of two `Int`s representing the range of lines
-- | that the command applies to.  So for `:12,25MyCommand`, the range is `[12, 25]`.
-- | When the command only applies to one line, that line number is repeated.
type CommandHandler = forall e. Vim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit

foreign import command' :: forall e. String
                                     -> Opts
                                     -> (Vim -> Args -> Range -> Eff (plugin :: PLUGIN | e) Unit)
                                     -> Eff (plugin :: PLUGIN | e) Unit

-- | Define a new Neovim command.
command :: forall e. String -> Opts -> CommandHandler -> Eff (plugin :: PLUGIN | e) Unit
command name opts = command' name opts <<< compose13 runHandler

foreign import commandSync' :: forall e. String
                                         -> Opts
                                         -> (Vim -> Args -> Range -> Done -> Eff (plugin :: PLUGIN | e) Unit)
                                         -> Eff (plugin :: PLUGIN | e) Unit

-- | Define a new Neovim command that will block until it completes.
commandSync :: forall e. String -> Opts -> CommandHandler -> Eff (plugin :: PLUGIN | e) Unit
commandSync name opts cmd = commandSync' name opts \vim args range done -> runHandlerSync done (cmd vim args range)

-- | The implementation of an autocmd
-- | The second argument is the filename corresponding the the buffer the event was triggered on.
type AutocmdHandler = forall e. Vim -> String -> Aff (plugin :: PLUGIN | e) Unit

foreign import autocmd' :: forall e. String
                                     -> Opts
                                     -> (Vim -> String -> Eff (plugin :: PLUGIN | e) Unit)
                                     -> Eff (plugin :: PLUGIN | e) Unit

-- | Define a new Neovim autocmd.
autocmd :: forall e. String -> Opts -> AutocmdHandler -> Eff (plugin :: PLUGIN | e) Unit
autocmd name opts = autocmd' name opts <<< compose12 runHandler

foreign import autocmdSync' :: forall e. String
                                         -> Opts
                                         -> (Vim -> String -> Done -> Eff (plugin :: PLUGIN | e) Unit)
                                         -> Eff (plugin :: PLUGIN | e) Unit

-- | Define a new Neovim autocmd that will block until it completes.
autocmdSync :: forall e. String -> Opts -> AutocmdHandler -> Eff (plugin :: PLUGIN | e) Unit
autocmdSync name opts cmd = autocmdSync' name opts \vim filename done -> runHandlerSync done (cmd vim filename)


type FunctionHandler = forall e. Vim -> Args -> Aff (plugin :: PLUGIN | e) Unit

foreign import function' :: forall e. String
                                      -> (Vim -> Args -> Eff (plugin :: PLUGIN | e) Unit)
                                      -> Eff (plugin :: PLUGIN | e) Unit

-- | Define a new Neovim function.
function :: forall e. String -> FunctionHandler -> Eff (plugin :: PLUGIN | e) Unit
function name = function' name <<< compose12 runHandler

foreign import functionSync' :: forall e. String
                                          -> (Vim -> Args -> Done -> Eff (plugin :: PLUGIN | e) Unit)
                                          -> Eff (plugin :: PLUGIN | e) Unit

-- | Define a new Neovim function that will block until it completes.
functionSync :: forall e. String -> FunctionHandler -> Eff (plugin :: PLUGIN | e) Unit
functionSync name func = functionSync' name \vim args done -> runHandlerSync done (func vim args)
