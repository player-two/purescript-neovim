module Neovim.Window where

import Prelude
import Control.Monad.Aff (makeAff, Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Data.StrMap (StrMap)

import Neovim.Plugin (PLUGIN)
import Neovim.Types


foreign import getBuffer' :: forall e. Window -> (Error -> Eff e Unit) -> (Buffer -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getBuffer :: forall a. Window -> Aff (plugin :: PLUGIN | a) Buffer
getBuffer window = makeAff $ getBuffer' window


foreign import getCursor' :: forall e. Window -> (Error -> Eff e Unit) -> ((Array Int) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getCursor :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
getCursor window = makeAff $ getCursor' window


foreign import setCursor' :: forall e. Window -> (Array Int) -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setCursor :: forall a. Window -> (Array Int) -> Aff (plugin :: PLUGIN | a) Unit
setCursor window pos = makeAff $ setCursor' window pos


foreign import getHeight' :: forall e. Window -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getHeight :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
getHeight window = makeAff $ getHeight' window


foreign import setHeight' :: forall e. Window -> Int -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setHeight :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
setHeight window height = makeAff $ setHeight' window height


foreign import getWidth' :: forall e. Window -> (Error -> Eff e Unit) -> (Int -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getWidth :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
getWidth window = makeAff $ getWidth' window


foreign import setWidth' :: forall e. Window -> Int -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setWidth :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
setWidth window width = makeAff $ setWidth' window width


foreign import getVar' :: forall e. Window -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar window name = makeAff $ getVar' window name


foreign import setVar' :: forall e. Window -> String -> Foreign -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setVar :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Foreign
setVar window name value = makeAff $ setVar' window name value


foreign import delVar' :: forall e. Window -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

delVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
delVar window name = makeAff $ delVar' window name


foreign import getOption' :: forall e. Window -> String -> (Error -> Eff e Unit) -> (Foreign -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getOption :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
getOption window name = makeAff $ getOption' window name


foreign import setOption' :: forall e. Window -> String -> Foreign -> (Error -> Eff e Unit) -> (Unit -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

setOption :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setOption window name value = makeAff $ setOption' window name value


foreign import getPosition' :: forall e. Window -> (Error -> Eff e Unit) -> ((Array Int) -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getPosition :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
getPosition window = makeAff $ getPosition' window


foreign import getTabpage' :: forall e. Window -> (Error -> Eff e Unit) -> (Tabpage -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

getTabpage :: forall a. Window -> Aff (plugin :: PLUGIN | a) Tabpage
getTabpage window = makeAff $ getTabpage' window


foreign import isValid' :: forall e. Window -> (Error -> Eff e Unit) -> (Boolean -> Eff e Unit) -> Eff (plugin :: PLUGIN | e) Unit

isValid :: forall a. Window -> Aff (plugin :: PLUGIN | a) Boolean
isValid window = makeAff $ isValid' window


