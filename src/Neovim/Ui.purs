module Neovim.Ui where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


foreign import attach' :: forall e1 e2. Vim -> Int -> Int -> Boolean -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

attach :: forall a. Vim -> Int -> Int -> Boolean -> Aff (plugin :: PLUGIN | a) Unit
attach vim width height enable_rgb = makeAff $ attach' vim width height enable_rgb


foreign import detach' :: forall e1 e2. Vim -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

detach :: forall a. Vim -> Aff (plugin :: PLUGIN | a) Unit
detach vim = makeAff $ detach' vim


foreign import tryResize' :: forall e1 e2. Vim -> Int -> Int -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

tryResize :: forall a. Vim -> Int -> Int -> Aff (plugin :: PLUGIN | a) Foreign
tryResize vim width height = makeAff $ tryResize' vim width height


