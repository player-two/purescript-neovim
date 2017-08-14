module Main where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff (Eff)
import Data.Foldable (sequence_)

import Neovim.Buffer (setLines)
import Neovim.Plugin (command, commandSync, defaultOpts, Args, Range, PLUGIN)
import Neovim.Types (Nvim)
import Neovim.Nvim (getCurrentBuf)

main :: forall e. Eff (plugin :: PLUGIN | e) Unit
main = sequence_ [ commandSync "HelloPurescriptSync" defaultOpts helloCmdSync
                 , command "HelloPurescript" defaultOpts helloCmd
                 ]

helloCmdSync :: forall e. Nvim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit
helloCmdSync nvim args range = getCurrentBuf nvim >>= \b -> setLines b 0 1 true ["Hi back! (sync)"]

helloCmd :: forall e. Nvim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit
helloCmd nvim args range = getCurrentBuf nvim >>= \b -> setLines b 0 1 true ["Hi back!"]
