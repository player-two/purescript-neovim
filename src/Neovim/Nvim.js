'use strict';

exports["uiAttach'"] = function (nvim) {
  return function (width) {
    return function (height) {
      return function (options) {
        return function (error) {
          return function (success) {
            return function () {
              nvim.uiAttach(width, height, options, function (err, result) {
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
exports["uiDetach'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.uiDetach(function (err, result) {
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
exports["uiTryResize'"] = function (nvim) {
  return function (width) {
    return function (height) {
      return function (error) {
        return function (success) {
          return function () {
            nvim.uiTryResize(width, height, function (err, result) {
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
exports["uiSetOption'"] = function (nvim) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            nvim.uiSetOption(name, value, function (err, result) {
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
exports["command'"] = function (nvim) {
  return function (command) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.command(command, function (err, result) {
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
exports["feedkeys'"] = function (nvim) {
  return function (keys) {
    return function (mode) {
      return function (escape_csi) {
        return function (error) {
          return function (success) {
            return function () {
              nvim.feedkeys(keys, mode, escape_csi, function (err, result) {
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
exports["input'"] = function (nvim) {
  return function (keys) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.input(keys, function (err, result) {
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
exports["replaceTermcodes'"] = function (nvim) {
  return function (str) {
    return function (from_part) {
      return function (do_lt) {
        return function (special) {
          return function (error) {
            return function (success) {
              return function () {
                nvim.replaceTermcodes(str, from_part, do_lt, special, function (err, result) {
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
}
exports["commandOutput'"] = function (nvim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.commandOutput(str, function (err, result) {
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
exports["eval'"] = function (nvim) {
  return function (expr) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.eval(expr, function (err, result) {
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
exports["callFunction'"] = function (nvim) {
  return function (fname) {
    return function (args) {
      return function (error) {
        return function (success) {
          return function () {
            nvim.callFunction(fname, args, function (err, result) {
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
exports["strwidth'"] = function (nvim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.strwidth(str, function (err, result) {
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
exports["listRuntimePaths'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.listRuntimePaths(function (err, result) {
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
exports["setCurrentDir'"] = function (nvim) {
  return function (dir) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.setCurrentDir(dir, function (err, result) {
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
exports["getCurrentLine'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.getCurrentLine(function (err, result) {
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
exports["setCurrentLine'"] = function (nvim) {
  return function (line) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.setCurrentLine(line, function (err, result) {
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
exports["delCurrentLine'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.delCurrentLine(function (err, result) {
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
exports["getVar'"] = function (nvim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.getVar(name, function (err, result) {
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
exports["setVar'"] = function (nvim) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            nvim.setVar(name, value, function (err, result) {
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
exports["delVar'"] = function (nvim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.delVar(name, function (err, result) {
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
exports["getVvar'"] = function (nvim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.getVvar(name, function (err, result) {
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
exports["getOption'"] = function (nvim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.getOption(name, function (err, result) {
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
exports["setOption'"] = function (nvim) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            nvim.setOption(name, value, function (err, result) {
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
exports["outWrite'"] = function (nvim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.outWrite(str, function (err, result) {
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
exports["errWrite'"] = function (nvim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.errWrite(str, function (err, result) {
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
exports["errWriteln'"] = function (nvim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.errWriteln(str, function (err, result) {
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
exports["listBufs'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.listBufs(function (err, result) {
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
exports["getCurrentBuf'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.getCurrentBuf(function (err, result) {
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
exports["setCurrentBuf'"] = function (nvim) {
  return function (buffer) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.setCurrentBuf(buffer, function (err, result) {
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
exports["listWins'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.listWins(function (err, result) {
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
exports["getCurrentWin'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.getCurrentWin(function (err, result) {
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
exports["setCurrentWin'"] = function (nvim) {
  return function (window) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.setCurrentWin(window, function (err, result) {
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
exports["listTabpages'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.listTabpages(function (err, result) {
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
exports["getCurrentTabpage'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.getCurrentTabpage(function (err, result) {
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
exports["setCurrentTabpage'"] = function (nvim) {
  return function (tabpage) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.setCurrentTabpage(tabpage, function (err, result) {
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
exports["subscribe'"] = function (nvim) {
  return function (event) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.subscribe(event, function (err, result) {
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
exports["unsubscribe'"] = function (nvim) {
  return function (event) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.unsubscribe(event, function (err, result) {
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
exports["getColorByName'"] = function (nvim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.getColorByName(name, function (err, result) {
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
exports["getColorMap'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.getColorMap(function (err, result) {
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
exports["getApiInfo'"] = function (nvim) {
  return function (error) {
    return function (success) {
      return function () {
        nvim.getApiInfo(function (err, result) {
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
exports["callAtomic'"] = function (nvim) {
  return function (calls) {
    return function (error) {
      return function (success) {
        return function () {
          nvim.callAtomic(calls, function (err, result) {
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
