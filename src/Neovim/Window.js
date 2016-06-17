'use strict';

module.exports["getBuffer'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.getBuffer(function (err, result) {
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
module.exports["getCursor'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.getCursor(function (err, result) {
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
module.exports["setCursor'"] = function (window) {
  return function (pos) {
    return function (error) {
      return function (success) {
        return function () {
          window.setCursor(pos, function (err, result) {
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
module.exports["getHeight'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.getHeight(function (err, result) {
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
module.exports["setHeight'"] = function (window) {
  return function (height) {
    return function (error) {
      return function (success) {
        return function () {
          window.setHeight(height, function (err, result) {
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
module.exports["getWidth'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.getWidth(function (err, result) {
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
module.exports["setWidth'"] = function (window) {
  return function (width) {
    return function (error) {
      return function (success) {
        return function () {
          window.setWidth(width, function (err, result) {
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
module.exports["getVar'"] = function (window) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          window.getVar(name, function (err, result) {
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
module.exports["setVar'"] = function (window) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            window.setVar(name, value, function (err, result) {
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
module.exports["delVar'"] = function (window) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          window.delVar(name, function (err, result) {
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
module.exports["getOption'"] = function (window) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          window.getOption(name, function (err, result) {
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
module.exports["setOption'"] = function (window) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            window.setOption(name, value, function (err, result) {
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
module.exports["getPosition'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.getPosition(function (err, result) {
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
module.exports["getTabpage'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.getTabpage(function (err, result) {
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
module.exports["isValid'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.isValid(function (err, result) {
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
