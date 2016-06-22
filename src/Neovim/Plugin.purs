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


foreign import data PLUGIN :: !

foreign import debug :: forall a e. a -> Eff (plugin :: PLUGIN | e) Unit


compose12 :: forall a b c d. (c -> d) -> (a -> b -> c) -> a -> b -> d
compose12 f g a = f <<< g a

compose13 :: forall a b c d e. (d -> e) -> (a -> b -> c -> d) -> a -> b -> c -> e
compose13 f g a = compose12 f (g a)


type Args = Array String
type Opts = StrMap String
type Range = Array Int

defaultOpts :: Opts
defaultOpts = insert "nargs" "*" (singleton "range" "")

-- `Done` should return an effect, but it is passed to Purescript as an argument from an FFI that cannot be changed.
-- Always use `wrapDone` to curry the foreign function and make it return an effect.
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

type CommandHandler = forall e. Vim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit

foreign import command' :: forall e. String
                                     -> Opts
                                     -> (Vim -> Args -> Range -> Eff (plugin :: PLUGIN | e) Unit)
                                     -> Eff (plugin :: PLUGIN | e) Unit

command :: forall e. String -> Opts -> CommandHandler -> Eff (plugin :: PLUGIN | e) Unit
command name opts = command' name opts <<< compose13 runHandler

foreign import commandSync' :: forall e. String
                                         -> Opts
                                         -> (Vim -> Args -> Range -> Done -> Eff (plugin :: PLUGIN | e) Unit)
                                         -> Eff (plugin :: PLUGIN | e) Unit

commandSync :: forall e. String -> Opts -> CommandHandler -> Eff (plugin :: PLUGIN | e) Unit
commandSync name opts cmd = commandSync' name opts \vim args range done -> runHandlerSync done (cmd vim args range)


type AutocmdHandler = forall e. Vim -> String -> Aff (plugin :: PLUGIN | e) Unit

foreign import autocmd' :: forall e. String
                                     -> Opts
                                     -> (Vim -> String -> Eff (plugin :: PLUGIN | e) Unit)
                                     -> Eff (plugin :: PLUGIN | e) Unit

autocmd :: forall e. String -> Opts -> AutocmdHandler -> Eff (plugin :: PLUGIN | e) Unit
autocmd name opts = autocmd' name opts <<< compose12 runHandler

foreign import autocmdSync' :: forall e. String
                                         -> Opts
                                         -> (Vim -> String -> Done -> Eff (plugin :: PLUGIN | e) Unit)
                                         -> Eff (plugin :: PLUGIN | e) Unit

autocmdSync :: forall e. String -> Opts -> AutocmdHandler -> Eff (plugin :: PLUGIN | e) Unit
autocmdSync name opts cmd = autocmdSync' name opts \vim filename done -> runHandlerSync done (cmd vim filename)


type FunctionHandler = forall e. Vim -> Args -> Aff (plugin :: PLUGIN | e) Unit

foreign import function' :: forall e. String
                                      -> (Vim -> Args -> Eff (plugin :: PLUGIN | e) Unit)
                                      -> Eff (plugin :: PLUGIN | e) Unit

function :: forall e. String -> FunctionHandler -> Eff (plugin :: PLUGIN | e) Unit
function name = function' name <<< compose12 runHandler

foreign import functionSync' :: forall e. String
                                          -> (Vim -> Args -> Done -> Eff (plugin :: PLUGIN | e) Unit)
                                          -> Eff (plugin :: PLUGIN | e) Unit

functionSync :: forall e. String -> FunctionHandler -> Eff (plugin :: PLUGIN | e) Unit
functionSync name func = functionSync' name \vim args done -> runHandlerSync done (func vim args)
