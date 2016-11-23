module Neovim.Window
  ( getBuf
  , getCursor
  , setCursor
  , getHeight
  , setHeight
  , getWidth
  , setWidth
  , getVar
  , setVar
  , delVar
  , getOption
  , setOption
  , getPosition
  , getTabpage
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


foreign import getBuf' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Buffer -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
getBuf :: forall a. Window -> Aff (plugin :: PLUGIN | a) Buffer
getBuf window = makeAff $ getBuf' window


foreign import getCursor' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> ((Array Int) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
getCursor :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
getCursor window = makeAff $ getCursor' window


foreign import setCursor' :: forall e1 e2. Window -> (Array Int) -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window pos`
setCursor :: forall a. Window -> (Array Int) -> Aff (plugin :: PLUGIN | a) Unit
setCursor window pos = makeAff $ setCursor' window pos


foreign import getHeight' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
getHeight :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
getHeight window = makeAff $ getHeight' window


foreign import setHeight' :: forall e1 e2. Window -> Int -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window height`
setHeight :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
setHeight window height = makeAff $ setHeight' window height


foreign import getWidth' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
getWidth :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
getWidth window = makeAff $ getWidth' window


foreign import setWidth' :: forall e1 e2. Window -> Int -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window width`
setWidth :: forall a. Window -> Int -> Aff (plugin :: PLUGIN | a) Unit
setWidth window width = makeAff $ setWidth' window width


foreign import getVar' :: forall e1 e2. Window -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name`
getVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
getVar window name = makeAff $ getVar' window name


foreign import setVar' :: forall e1 e2. Window -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name value`
setVar :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setVar window name value = makeAff $ setVar' window name value


foreign import delVar' :: forall e1 e2. Window -> String -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name`
delVar :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Unit
delVar window name = makeAff $ delVar' window name


foreign import getOption' :: forall e1 e2. Window -> String -> (Error -> Eff e1 Unit) -> (Foreign -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name`
getOption :: forall a. Window -> String -> Aff (plugin :: PLUGIN | a) Foreign
getOption window name = makeAff $ getOption' window name


foreign import setOption' :: forall e1 e2. Window -> String -> Foreign -> (Error -> Eff e1 Unit) -> (Unit -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window name value`
setOption :: forall a. Window -> String -> Foreign -> Aff (plugin :: PLUGIN | a) Unit
setOption window name value = makeAff $ setOption' window name value


foreign import getPosition' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> ((Array Int) -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
getPosition :: forall a. Window -> Aff (plugin :: PLUGIN | a) (Array Int)
getPosition window = makeAff $ getPosition' window


foreign import getTabpage' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Tabpage -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
getTabpage :: forall a. Window -> Aff (plugin :: PLUGIN | a) Tabpage
getTabpage window = makeAff $ getTabpage' window


foreign import getNumber' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Int -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
getNumber :: forall a. Window -> Aff (plugin :: PLUGIN | a) Int
getNumber window = makeAff $ getNumber' window


foreign import isValid' :: forall e1 e2. Window -> (Error -> Eff e1 Unit) -> (Boolean -> Eff e1 Unit) -> Eff (plugin :: PLUGIN | e2) Unit

-- | args: `window`
isValid :: forall a. Window -> Aff (plugin :: PLUGIN | a) Boolean
isValid window = makeAff $ isValid' window


