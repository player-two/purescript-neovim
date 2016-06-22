module Neovim.Tabpage
  ( getWindows
  , getVar
  , setVar
  , delVar
  , getWindow
  , isValid
  ) where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


foreign import getWindows' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> ((Array Window) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getWindows :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) (Array Window)
getWindows tabpage = makeAff $ getWindows' tabpage


foreign import getVar' :: forall e1 e2. Tabpage -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar tabpage name = makeAff $ getVar' tabpage name


foreign import setVar' :: forall e1 e2. Tabpage -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

setVar :: forall a. Tabpage -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
setVar tabpage name value = makeAff $ setVar' tabpage name value


foreign import delVar' :: forall e1 e2. Tabpage -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

delVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
delVar tabpage name = makeAff $ delVar' tabpage name


foreign import getWindow' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> (Window -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

getWindow :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Window
getWindow tabpage = makeAff $ getWindow' tabpage


foreign import isValid' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> (Boolean -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

isValid :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Boolean
isValid tabpage = makeAff $ isValid' tabpage


