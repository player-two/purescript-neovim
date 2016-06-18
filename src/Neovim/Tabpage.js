'use strict';

exports["getWindows'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.getWindows(function (err, result) {
          if (err) {
            error(err);
          } else {
            success(result);
          }
        });
      }
    }
  }
}
exports["getVar'"] = function (tabpage) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          tabpage.getVar(name, function (err, result) {
            if (err) {
              error(err);
            } else {
              success(result);
            }
          });
        }
      }
    }
  }
}
exports["setVar'"] = function (tabpage) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            tabpage.setVar(name, value, function (err, result) {
              if (err) {
                error(err);
              } else {
                success(result);
              }
            });
          }
        }
      }
    }
  }
}
exports["delVar'"] = function (tabpage) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          tabpage.delVar(name, function (err, result) {
            if (err) {
              error(err);
            } else {
              success(result);
            }
          });
        }
      }
    }
  }
}
exports["getWindow'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.getWindow(function (err, result) {
          if (err) {
            error(err);
          } else {
            success(result);
          }
        });
      }
    }
  }
}
exports["isValid'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.isValid(function (err, result) {
          if (err) {
            error(err);
          } else {
            success(result);
          }
        });
      }
    }
  }
}
