'use strict';

exports.debug = function (obj) {
  return function () {
    debug(obj)
  }
};

var getPlugin = function () {
  if (plugin) {
    return plugin;
  } else {
    throw new Error('Module not loaded inside neovim node-host environment.');
  }
};

exports["wrapDone"] = function (done) {
  return function (err) {
    return function (result) {
      return function () {
        return done(err, result);
      };
    };
  };
};

exports["commandSync'"] = function (name) {
  return function (opts) {
    return function (fn) {
      return function () {
        getPlugin().commandSync(name, opts, function (vim, args, range, done) {
          fn(vim)(args)(range)(done)();
        });
      }
    }
  }
};

exports["command'"] = function (name) {
  return function (opts) {
    return function (fn) {
      return function () {
        getPlugin().command(name, opts, function (vim, args, range) {
          fn(vim)(args)(range)();
        });
      }
    }
  }
};
