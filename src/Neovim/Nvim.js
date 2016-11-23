'use strict';

exports["uiAttach'"] = function (vim) {
  return function (width) {
    return function (height) {
      return function (options) {
        return function (error) {
          return function (success) {
            return function () {
              vim.uiAttach(width, height, options, function (err, result) {
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
}
exports["uiDetach'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.uiDetach(function (err, result) {
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
exports["uiTryResize'"] = function (vim) {
  return function (width) {
    return function (height) {
      return function (error) {
        return function (success) {
          return function () {
            vim.uiTryResize(width, height, function (err, result) {
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
exports["uiSetOption'"] = function (vim) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            vim.uiSetOption(name, value, function (err, result) {
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
exports["command'"] = function (command) {
  return function (error) {
    return function (success) {
      return function () {
        command.command(function (err, result) {
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
exports["feedkeys'"] = function (keys) {
  return function (mode) {
    return function (escape_csi) {
      return function (error) {
        return function (success) {
          return function () {
            keys.feedkeys(mode, escape_csi, function (err, result) {
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
exports["input'"] = function (keys) {
  return function (error) {
    return function (success) {
      return function () {
        keys.input(function (err, result) {
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
exports["replaceTermcodes'"] = function (str) {
  return function (from_part) {
    return function (do_lt) {
      return function (special) {
        return function (error) {
          return function (success) {
            return function () {
              str.replaceTermcodes(from_part, do_lt, special, function (err, result) {
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
}
exports["commandOutput'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.commandOutput(function (err, result) {
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
exports["eval'"] = function (expr) {
  return function (error) {
    return function (success) {
      return function () {
        expr.eval(function (err, result) {
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
exports["callFunction'"] = function (fname) {
  return function (args) {
    return function (error) {
      return function (success) {
        return function () {
          fname.callFunction(args, function (err, result) {
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
exports["strwidth'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.strwidth(function (err, result) {
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
exports["listRuntimePaths'"] = function (error) {
  return function (success) {
    return function () {
      .listRuntimePaths(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["setCurrentDir'"] = function (dir) {
  return function (error) {
    return function (success) {
      return function () {
        dir.setCurrentDir(function (err, result) {
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
exports["getCurrentLine'"] = function (error) {
  return function (success) {
    return function () {
      .getCurrentLine(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["setCurrentLine'"] = function (line) {
  return function (error) {
    return function (success) {
      return function () {
        line.setCurrentLine(function (err, result) {
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
exports["delCurrentLine'"] = function (error) {
  return function (success) {
    return function () {
      .delCurrentLine(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["getVar'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.getVar(function (err, result) {
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
exports["setVar'"] = function (name) {
  return function (value) {
    return function (error) {
      return function (success) {
        return function () {
          name.setVar(value, function (err, result) {
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
exports["delVar'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.delVar(function (err, result) {
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
exports["getVvar'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.getVvar(function (err, result) {
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
exports["getOption'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.getOption(function (err, result) {
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
exports["setOption'"] = function (name) {
  return function (value) {
    return function (error) {
      return function (success) {
        return function () {
          name.setOption(value, function (err, result) {
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
exports["outWrite'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.outWrite(function (err, result) {
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
exports["errWrite'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.errWrite(function (err, result) {
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
exports["errWriteln'"] = function (str) {
  return function (error) {
    return function (success) {
      return function () {
        str.errWriteln(function (err, result) {
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
exports["listBufs'"] = function (error) {
  return function (success) {
    return function () {
      .listBufs(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["getCurrentBuf'"] = function (error) {
  return function (success) {
    return function () {
      .getCurrentBuf(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["setCurrentBuf'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.setCurrentBuf(function (err, result) {
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
exports["listWins'"] = function (error) {
  return function (success) {
    return function () {
      .listWins(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["getCurrentWin'"] = function (error) {
  return function (success) {
    return function () {
      .getCurrentWin(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["setCurrentWin'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.setCurrentWin(function (err, result) {
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
exports["listTabpages'"] = function (error) {
  return function (success) {
    return function () {
      .listTabpages(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["getCurrentTabpage'"] = function (error) {
  return function (success) {
    return function () {
      .getCurrentTabpage(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["setCurrentTabpage'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.setCurrentTabpage(function (err, result) {
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
exports["subscribe'"] = function (event) {
  return function (error) {
    return function (success) {
      return function () {
        event.subscribe(function (err, result) {
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
exports["unsubscribe'"] = function (event) {
  return function (error) {
    return function (success) {
      return function () {
        event.unsubscribe(function (err, result) {
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
exports["getColorByName'"] = function (name) {
  return function (error) {
    return function (success) {
      return function () {
        name.getColorByName(function (err, result) {
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
exports["getColorMap'"] = function (error) {
  return function (success) {
    return function () {
      .getColorMap(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["getApiInfo'"] = function (error) {
  return function (success) {
    return function () {
      .getApiInfo(function (err, result) {
        if (err) {
          error(err)();
        } else {
          success(result)();
        }
      });
    }
  }
}
exports["callAtomic'"] = function (calls) {
  return function (error) {
    return function (success) {
      return function () {
        calls.callAtomic(function (err, result) {
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
