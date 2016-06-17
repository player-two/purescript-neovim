'use strict';

exports.plugin = function () {
  if (plugin) {
    return plugin;
  } else {
    throw new Error('Module not loaded inside neovim node-host environment.');
  }
};
