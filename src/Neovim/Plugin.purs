module Neovim.Plugin where

import Prelude
import Control.Monad.Aff (runAff, Aff)
import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (toNullable)
import Data.StrMap (insert, singleton, StrMap)

import Neovim.Types (Vim)

foreign import data PLUGIN :: !

foreign import debug :: forall a e. a -> Eff (plugin :: PLUGIN | e) Unit


type Args = Array String
type Opts = StrMap String
type Range = String
type Command = forall e. Vim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit

defaultOpts :: Opts
defaultOpts = insert "nargs" "*" (singleton "range" "")

ignore :: forall a e. Eff e a -> Eff e Unit
ignore = (_ >>= \_ -> pure unit)


-- `Done` should return an effect, but it is passed to Purescript as an argument from an FFI that cannot be changed.
-- Always use `wrapDone` to curry the foreign function and make it return an effect.
type Done = forall a b. a -> b -> Unit
foreign import wrapDone :: forall a b e. Done -> a -> b -> Eff (plugin :: PLUGIN | e) Unit


foreign import commandSync' :: forall e. String
                                         -> Opts
                                         -> (Vim -> Args -> Range -> Done -> Eff (plugin :: PLUGIN | e) Unit)
                                         -> Eff (plugin :: PLUGIN | e) Unit

runCommandSync :: forall e. Command -> Vim -> Args -> Range -> Done -> Eff (plugin :: PLUGIN | e) Unit
runCommandSync cmd vim args range done = ignore $ runAff (flip (wrapDone done) null) (wrapDone done null) (cmd vim args range)
  where null = toNullable Nothing

commandSync :: forall e. String -> Opts -> Command -> Eff (plugin :: PLUGIN | e) Unit
commandSync name opts cmd = commandSync' name opts (runCommandSync cmd)


foreign import command' :: forall e. String
                                     -> Opts
                                     -> (Vim -> Args -> Range -> Eff (plugin :: PLUGIN | e) Unit)
                                     -> Eff (plugin :: PLUGIN | e) Unit

command :: forall e. String -> Opts -> Command -> Eff (plugin :: PLUGIN | e) Unit
command name opts cmd = command' name opts \vim args range -> ignore $ runAff debug debug (cmd vim args range)

--function
--functionSync
--autocmd
--autocmdSync
