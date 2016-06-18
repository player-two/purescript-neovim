'use strict';

exports["command'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.command(str, function (err, result) {
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
exports["feedkeys'"] = function (vim) {
  return function (keys) {
    return function (mode) {
      return function (escape_csi) {
        return function (error) {
          return function (success) {
            return function () {
              vim.feedkeys(keys, mode, escape_csi, function (err, result) {
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
exports["input'"] = function (vim) {
  return function (keys) {
    return function (error) {
      return function (success) {
        return function () {
          vim.input(keys, function (err, result) {
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
exports["replaceTermcodes'"] = function (vim) {
  return function (str) {
    return function (from_part) {
      return function (do_lt) {
        return function (special) {
          return function (error) {
            return function (success) {
              return function () {
                vim.replaceTermcodes(str, from_part, do_lt, special, function (err, result) {
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
}
exports["commandOutput'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.commandOutput(str, function (err, result) {
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
exports["eval'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.eval(str, function (err, result) {
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
exports["callFunction'"] = function (vim) {
  return function (fname) {
    return function (args) {
      return function (error) {
        return function (success) {
          return function () {
            vim.callFunction(fname, args, function (err, result) {
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
exports["strwidth'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.strwidth(str, function (err, result) {
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
exports["listRuntimePaths'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.listRuntimePaths(function (err, result) {
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
exports["changeDirectory'"] = function (vim) {
  return function (dir) {
    return function (error) {
      return function (success) {
        return function () {
          vim.changeDirectory(dir, function (err, result) {
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
exports["getCurrentLine'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.getCurrentLine(function (err, result) {
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
exports["setCurrentLine'"] = function (vim) {
  return function (line) {
    return function (error) {
      return function (success) {
        return function () {
          vim.setCurrentLine(line, function (err, result) {
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
exports["delCurrentLine'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.delCurrentLine(function (err, result) {
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
exports["getVar'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.getVar(name, function (err, result) {
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
exports["setVar'"] = function (vim) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            vim.setVar(name, value, function (err, result) {
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
exports["delVar'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.delVar(name, function (err, result) {
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
exports["getVvar'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.getVvar(name, function (err, result) {
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
exports["getOption'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.getOption(name, function (err, result) {
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
exports["setOption'"] = function (vim) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            vim.setOption(name, value, function (err, result) {
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
exports["outWrite'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.outWrite(str, function (err, result) {
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
exports["errWrite'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.errWrite(str, function (err, result) {
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
exports["reportError'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.reportError(str, function (err, result) {
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
exports["getBuffers'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.getBuffers(function (err, result) {
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
exports["getCurrentBuffer'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.getCurrentBuffer(function (err, result) {
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
exports["setCurrentBuffer'"] = function (vim) {
  return function (buffer) {
    return function (error) {
      return function (success) {
        return function () {
          vim.setCurrentBuffer(buffer, function (err, result) {
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
exports["getWindows'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.getWindows(function (err, result) {
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
exports["getCurrentWindow'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.getCurrentWindow(function (err, result) {
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
exports["setCurrentWindow'"] = function (vim) {
  return function (window) {
    return function (error) {
      return function (success) {
        return function () {
          vim.setCurrentWindow(window, function (err, result) {
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
exports["getTabpages'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.getTabpages(function (err, result) {
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
exports["getCurrentTabpage'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.getCurrentTabpage(function (err, result) {
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
exports["setCurrentTabpage'"] = function (vim) {
  return function (tabpage) {
    return function (error) {
      return function (success) {
        return function () {
          vim.setCurrentTabpage(tabpage, function (err, result) {
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
exports["subscribe'"] = function (vim) {
  return function (event) {
    return function (error) {
      return function (success) {
        return function () {
          vim.subscribe(event, function (err, result) {
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
exports["unsubscribe'"] = function (vim) {
  return function (event) {
    return function (error) {
      return function (success) {
        return function () {
          vim.unsubscribe(event, function (err, result) {
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
exports["nameToColor'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.nameToColor(name, function (err, result) {
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
exports["getColorMap'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.getColorMap(function (err, result) {
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
exports["getApiInfo'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.getApiInfo(function (err, result) {
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
