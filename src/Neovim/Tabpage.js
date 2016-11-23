'use strict';

exports["listWins'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.listWins(function (err, result) {
          if (err) {
            error(err)();
          } else {
            success(result)();
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
              error(err)();
            } else {
              success(result)();
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
                error(err)();
              } else {
                success(result)();
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
              error(err)();
            } else {
              success(result)();
            }
          });
        }
      }
    }
  }
}
exports["getWin'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.getWin(function (err, result) {
          if (err) {
            error(err)();
          } else {
            success(result)();
          }
        });
      }
    }
  }
}
exports["getNumber'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.getNumber(function (err, result) {
          if (err) {
            error(err)();
          } else {
            success(result)();
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
            error(err)();
          } else {
            success(result)();
          }
        });
      }
    }
  }
}
