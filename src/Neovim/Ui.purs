module Neovim.Ui where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


foreign import attach' :: forall e. Int -> Int -> Boolean -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

attach :: forall a. Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
attach width height enable_rgb = makeAff $ attach' width height enable_rgb


foreign import detach' :: forall e. (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

detach :: forall a. Aff (plugin :: PLUGIN | a) Unit
detach  = makeAff $ detach' 


foreign import tryResize' :: forall e. Int -> Int -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

tryResize :: forall a. Int -> Int -> Aff (plugin :: PLUGIN | a) Foreign
tryResize width height = makeAff $ tryResize' width height


