module Neovim.Tabpage
  ( listWins
  , getVar
  , setVar
  , delVar
  , getWin
  , getNumber
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


foreign import listWins' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> ((Array Window) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage`
listWins :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) (Array Window)
listWins tabpage = makeAff $ listWins' tabpage


foreign import getVar' :: forall e1 e2. Tabpage -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage name`
getVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar tabpage name = makeAff $ getVar' tabpage name


foreign import setVar' :: forall e1 e2. Tabpage -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage name value`
setVar :: forall a. Tabpage -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setVar tabpage name value = makeAff $ setVar' tabpage name value


foreign import delVar' :: forall e1 e2. Tabpage -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage name`
delVar :: forall a. Tabpage -> String -> Aff (plugin :: PLUGIN | a) Unit
delVar tabpage name = makeAff $ delVar' tabpage name


foreign import getWin' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> (Window -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage`
getWin :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Window
getWin tabpage = makeAff $ getWin' tabpage


foreign import getNumber' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage`
getNumber :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Int
getNumber tabpage = makeAff $ getNumber' tabpage


foreign import isValid' :: forall e1 e2. Tabpage -> (Error -> Eff e1 Unit) -> (Boolean -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `tabpage`
isValid :: forall a. Tabpage -> Aff (plugin :: PLUGIN | a) Boolean
isValid tabpage = makeAff $ isValid' tabpage


