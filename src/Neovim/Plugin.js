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

exports["function'"] = function (name) {
  return function (opts) {
    return function (fn) {
      return function () {
        getPlugin()['function'](name, opts, function (vim, args) {
          fn(vim)(args)();
        });
      }
    }
  }
};

exports["functionSync'"] = function (name) {
  return function (opts) {
    return function (fn) {
      return function () {
        getPlugin().functionSync(name, opts, function (vim, args, done) {
          fn(vim)(args)(done)();
        });
      }
    }
  }
};

exports["autocmd'"] = function (name) {
  return function (opts) {
    return function (fn) {
      return function () {
        getPlugin().autocmd(name, opts, function (vim, filename) {
          fn(vim)(filename)();
        });
      }
    }
  }
};

exports["autocmdSync'"] = function (name) {
  return function (opts) {
    return function (fn) {
      return function () {
        getPlugin().autocmdSync(name, opts, function (vim, filename, done) {
          fn(vim)(filename)(done)();
        });
      }
    }
  }
};
