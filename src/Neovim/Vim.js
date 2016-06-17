'use strict';

module.exports["command'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.command(function (err, result) {
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
module.exports["feedkeys'"] = function (keys) {
  return function (mode) {
    return function (escape_csi) {
      return function (error) {
        return function (success) {
          return function () {
            keys.feedkeys(mode, escape_csi, function (err, result) {
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
module.exports["input'"] = function (keys) {
  return function (error) {
    return function (success) {
      return function () {
        keys.input(function (err, result) {
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
module.exports["replaceTermcodes'"] = function (str) {
  return function (from_part) {
    return function (do_lt) {
      return function (special) {
        return function (error) {
          return function (success) {
            return function () {
              str.replaceTermcodes(from_part, do_lt, special, function (err, result) {
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
}
module.exports["commandOutput'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.commandOutput(function (err, result) {
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
module.exports["eval'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.eval(function (err, result) {
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
module.exports["callFunction'"] = function (fname) {
  return function (args) {
    return function (error) {
      return function (success) {
        return function () {
          fname.callFunction(args, function (err, result) {
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
module.exports["strwidth'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.strwidth(function (err, result) {
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
module.exports["listRuntimePaths'"] = function (error) {
  return function (success) {
    return function () {
      .listRuntimePaths(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["changeDirectory'"] = function (dir) {
  return function (error) {
    return function (success) {
      return function () {
        dir.changeDirectory(function (err, result) {
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
module.exports["getCurrentLine'"] = function (error) {
  return function (success) {
    return function () {
      .getCurrentLine(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["setCurrentLine'"] = function (line) {
  return function (error) {
    return function (success) {
      return function () {
        line.setCurrentLine(function (err, result) {
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
module.exports["delCurrentLine'"] = function (error) {
  return function (success) {
    return function () {
      .delCurrentLine(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["getVar'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.getVar(function (err, result) {
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
module.exports["setVar'"] = function (name) {
  return function (value) {
    return function (error) {
      return function (success) {
        return function () {
          name.setVar(value, function (err, result) {
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
module.exports["delVar'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.delVar(function (err, result) {
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
module.exports["getVvar'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.getVvar(function (err, result) {
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
module.exports["getOption'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.getOption(function (err, result) {
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
module.exports["setOption'"] = function (name) {
  return function (value) {
    return function (error) {
      return function (success) {
        return function () {
          name.setOption(value, function (err, result) {
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
module.exports["outWrite'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.outWrite(function (err, result) {
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
module.exports["errWrite'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.errWrite(function (err, result) {
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
module.exports["reportError'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.reportError(function (err, result) {
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
module.exports["getBuffers'"] = function (error) {
  return function (success) {
    return function () {
      .getBuffers(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["getCurrentBuffer'"] = function (error) {
  return function (success) {
    return function () {
      .getCurrentBuffer(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["setCurrentBuffer'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.setCurrentBuffer(function (err, result) {
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
module.exports["getWindows'"] = function (error) {
  return function (success) {
    return function () {
      .getWindows(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["getCurrentWindow'"] = function (error) {
  return function (success) {
    return function () {
      .getCurrentWindow(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["setCurrentWindow'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.setCurrentWindow(function (err, result) {
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
module.exports["getTabpages'"] = function (error) {
  return function (success) {
    return function () {
      .getTabpages(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["getCurrentTabpage'"] = function (error) {
  return function (success) {
    return function () {
      .getCurrentTabpage(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["setCurrentTabpage'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.setCurrentTabpage(function (err, result) {
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
module.exports["subscribe'"] = function (event) {
  return function (error) {
    return function (success) {
      return function () {
        event.subscribe(function (err, result) {
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
module.exports["unsubscribe'"] = function (event) {
  return function (error) {
    return function (success) {
      return function () {
        event.unsubscribe(function (err, result) {
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
module.exports["nameToColor'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.nameToColor(function (err, result) {
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
module.exports["getColorMap'"] = function (error) {
  return function (success) {
    return function () {
      .getColorMap(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["getApiInfo'"] = function (error) {
  return function (success) {
    return function () {
      .getApiInfo(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
