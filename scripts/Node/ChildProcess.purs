module Node.ChildProcess where

import Prelude (Unit)
import Control.Monad.Eff (Eff())
import Data.Maybe (Maybe(Just, Nothing))
import Node.Buffer (Buffer)

foreign import data CHILD_PROCESS :: !

foreign import execImpl :: forall e x. (x -> Maybe x) -> (Maybe x) -> String
                                     -> (ExecResult -> Eff (cp :: CHILD_PROCESS | e) Unit)
                                     -> Eff (cp :: CHILD_PROCESS | e) Unit

type ExecResult =
  { stdout :: Buffer
  , stderr :: Buffer
  , error :: Maybe String
  }

exec = execImpl Just Nothing
