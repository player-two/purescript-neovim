# purescript-neovim

[![Latest release](http://img.shields.io/github/release/megalord/purescript-neovim.svg)](https://github.com/megalord/purescript-neovim/releases)

Purescript bindings for the Neovim remote plugin API for use with the [node host](https://github.com/neovim/node-host).

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

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-neovim).
