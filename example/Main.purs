module Main where

import Prelude
import Control.Monad.Aff (Aff)
import Control.Monad.Eff (Eff)

import Neovim.Buffer (setLine)
import Neovim.Plugin (command, defaultOpts, Args, PLUGIN)
import Neovim.Types (Vim)
import Neovim.Vim (getCurrentBuffer)

main :: forall e. Eff (plugin :: PLUGIN | e) Unit
main = command "HelloPurescript" defaultOpts fooCmd

fooCmd :: forall e. Vim -> Args -> String -> Aff (plugin :: PLUGIN | e) Unit
fooCmd vim args range = getCurrentBuffer vim >>= \b -> setLine b 0 "Hi back!"
