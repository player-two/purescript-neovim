module Neovim.Plugin where

import Prelude
import Control.Monad.Aff (runAff, Aff)
import Control.Monad.Eff (Eff)
import Data.StrMap (insert, singleton, StrMap)

import Neovim.Types (Vim)

foreign import data PLUGIN :: !

foreign import debug :: forall a e. a -> Eff (plugin :: PLUGIN | e) Unit


type Args = Array String
type Opts = StrMap String
type Range = String
type Done = forall a b e. a -> b -> Eff (plugin :: PLUGIN | e) Unit
type Command = forall e. Vim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit

defaultOpts :: Opts
defaultOpts = insert "nargs" "*" (singleton "range" "")

ignore :: forall a e. Eff e a -> Eff e Unit
ignore = (_ >>= \_ -> pure unit)


foreign import commandSync' :: forall e. String
                                         -> Opts
                                         -> (Vim -> Args -> Range -> Done -> Eff (plugin :: PLUGIN | e) Unit)
                                         -> Eff (plugin :: PLUGIN | e) Unit

runCommandSync :: forall e. Command -> Vim -> Args -> Range -> Done -> Eff (plugin :: PLUGIN | e) Unit
runCommandSync cmd vim args range done = ignore $ runAff (\err -> done err false) (done false) (cmd vim args range)

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
