module Neovim.Tabpage where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


foreign import getWindows' :: forall e. Tabpage -> (Error -> Eff e Unit) -> ((Array Window) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getWindows :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) (Array Window)
getWindows tabpage = makeAff $ getWindows' tabpage


foreign import getVar' :: forall e. Tabpage -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar tabpage name = makeAff $ getVar' tabpage name


foreign import setVar' :: forall e. Tabpage -> String -> Foreign -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setVar :: forall a. Tabpage -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
setVar tabpage name value = makeAff $ setVar' tabpage name value


foreign import delVar' :: forall e. Tabpage -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

delVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
delVar tabpage name = makeAff $ delVar' tabpage name


foreign import getWindow' :: forall e. Tabpage -> (Error -> Eff e Unit) -> (Window -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getWindow :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Window
getWindow tabpage = makeAff $ getWindow' tabpage


foreign import isValid' :: forall e. Tabpage -> (Error -> Eff e Unit) -> (Boolean -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

isValid :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Boolean
isValid tabpage = makeAff $ isValid' tabpage


