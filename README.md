# purescript-neovim

Purescript bindings for the Neovim remote plugin API for use with the [node host](https://github.com/neovim/node-host).

Note: This project is still in very early development and is not at all stable.  As such, it has not been published to bower or pursuit, though that is the goal.

### Example Installation

* Follow the installation instructions for the node host.
* Build the example (you need to create the `rplugin/node` directory if it does not exist)
```
pulp build --src-path example --include src --to ~/.nvim/rplugin/node/purescript-neovim.js
```
* Update your plugins via `UpdateRemotePlugins`.
* Restart neovim and run the `HelloPurescript` command.  You should see `Hi back!` appear in the current buffer.


### Debugging

Any errors in the plugin will be logged to `NEOVIM_JS_DEBUG`, which is not set by default.  To start a debug session, use something like
```
NEOVIM_JS_DEBUG=./nvim-debug.log nvim
```


### Interface

The interface is auto-generated from the metadata returned by `nvim --api-info`.  To build it, run
```
pulp run --src-path scripts -m NeovimTypes
```
