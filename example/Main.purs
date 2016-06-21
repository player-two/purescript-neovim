module Main where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff (Eff)
import Data.Foldable (sequence_)

import Neovim.Buffer (setLine)
import Neovim.Plugin (command, commandSync, defaultOpts, Args, Range, PLUGIN)
import Neovim.Types (Vim)
import Neovim.Vim (getCurrentBuffer)

main :: forall e. Eff (plugin :: PLUGIN | e) Unit
main = sequence_ [ commandSync "HelloPurescriptSync" defaultOpts helloCmdSync
                 , command "HelloPurescript" defaultOpts helloCmd
                 ]

helloCmdSync :: forall e. Vim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit
helloCmdSync vim args range = getCurrentBuffer vim >>= \b -> setLine b 0 "Hi back! (sync)"

helloCmd :: forall e. Vim -> Args -> Range -> Aff (plugin :: PLUGIN | e) Unit
helloCmd vim args range = getCurrentBuffer vim >>= \b -> setLine b 0 "Hi back!"
