exports.execImpl = function (just) {
  return function (none) {
    return function (command) {
      return function (cb) {
        return function () {
          return require('child_process').exec(command, function (err, stdout, stderr) {
            return cb({
              stdout: stdout,
              stderr: stderr,
              error: err ? just(err) : none
            })();
          });
        }
      }
    }
  }
}
