module Neovim.Plugin where

import Prelude (Unit)
import Control.Monad.Eff (Eff())

foreign import data PLUGIN :: !

-- don't actually need this
foreign import plugin :: forall eff. Eff (plugin :: PLUGIN | eff) Unit

--command
--commandSync
--function
--functionSync
--autocmd
--autocmdSync
