module Neovim.Plugin where

import Prelude
import Control.Monad.Aff (runAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Maybe (Maybe)
import Data.StrMap (insert, singleton, StrMap)

import Neovim.Types (Vim)

foreign import data PLUGIN :: !

foreign import debug :: forall a e. a -> Eff (plugin :: PLUGIN | e) Unit

type Done = forall e. Maybe Error -> Eff (plugin :: PLUGIN | e) Unit

type Args = Array String
type Opts = StrMap String
type Range = String
--type Command = Vim -> Args -> Range

defaultOpts :: Opts
defaultOpts = insert "nargs" "*" (singleton "range" "")

--foreign import commandSync :: forall e. String
--                                        -> Opts
--                                        -> (Vim -> Args -> Range -> Done)
--                                        -> Eff (plugin :: PLUGIN | e) Unit

foreign import command' :: forall e1 e2. String
                                         -> Opts
                                         -> (Vim -> Args -> Range -> Eff (plugin :: PLUGIN | e2) Unit)
                                         -> Eff (plugin :: PLUGIN | e1) Unit

command :: forall e1 e2. String
                         -> Opts
                         -> (Vim -> Args -> Range -> Aff (plugin :: PLUGIN | e2) Unit)
                         -> Eff (plugin :: PLUGIN | e1) Unit
command name opts cmd = command' name opts (\vim args range -> run $ cmd vim args range)

run :: forall a e. Aff (plugin :: PLUGIN | e) a -> Eff (plugin :: PLUGIN | e) Unit
run aff = runAff debug (\_ -> pure unit) aff >>= (\_ -> pure unit)

--function
--functionSync
--autocmd
--autocmdSync
