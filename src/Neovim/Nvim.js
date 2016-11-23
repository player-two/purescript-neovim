'use strict';

exports["bufferGetLine'"] = function (buffer) {
  return function (index) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.bufferGetLine(index, function (err, result) {
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
exports["bufferSetLine'"] = function (buffer) {
  return function (index) {
    return function (line) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.bufferSetLine(index, line, function (err, result) {
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
exports["bufferDelLine'"] = function (buffer) {
  return function (index) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.bufferDelLine(index, function (err, result) {
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
exports["bufferGetLineSlice'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (include_start) {
        return function (include_end) {
          return function (error) {
            return function (success) {
              return function () {
                buffer.bufferGetLineSlice(start, end, include_start, include_end, function (err, result) {
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
exports["bufferSetLineSlice'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (include_start) {
        return function (include_end) {
          return function (replacement) {
            return function (error) {
              return function (success) {
                return function () {
                  buffer.bufferSetLineSlice(start, end, include_start, include_end, replacement, function (err, result) {
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
}
exports["bufferSetVar'"] = function (buffer) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.bufferSetVar(name, value, function (err, result) {
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
exports["bufferDelVar'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.bufferDelVar(name, function (err, result) {
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
exports["bufferInsert'"] = function (buffer) {
  return function (lnum) {
    return function (lines) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.bufferInsert(lnum, lines, function (err, result) {
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
exports["tabpageSetVar'"] = function (tabpage) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            tabpage.tabpageSetVar(name, value, function (err, result) {
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
exports["tabpageDelVar'"] = function (tabpage) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          tabpage.tabpageDelVar(name, function (err, result) {
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
exports["uiAttach'"] = function (vim) {
  return function (width) {
    return function (height) {
      return function (enable_rgb) {
        return function (error) {
          return function (success) {
            return function () {
              vim.uiAttach(width, height, enable_rgb, function (err, result) {
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
exports["vimSetVar'"] = function (vim) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            vim.vimSetVar(name, value, function (err, result) {
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
exports["vimDelVar'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimDelVar(name, function (err, result) {
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
exports["windowSetVar'"] = function (window) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            window.windowSetVar(name, value, function (err, result) {
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
exports["windowDelVar'"] = function (window) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          window.windowDelVar(name, function (err, result) {
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
exports["bufferLineCount'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.bufferLineCount(function (err, result) {
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
exports["bufferGetLines'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (strict_indexing) {
        return function (error) {
          return function (success) {
            return function () {
              buffer.bufferGetLines(start, end, strict_indexing, function (err, result) {
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
exports["bufferSetLines'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (strict_indexing) {
        return function (replacement) {
          return function (error) {
            return function (success) {
              return function () {
                buffer.bufferSetLines(start, end, strict_indexing, replacement, function (err, result) {
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
exports["bufferGetVar'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.bufferGetVar(name, function (err, result) {
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
exports["bufferGetOption'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.bufferGetOption(name, function (err, result) {
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
exports["bufferSetOption'"] = function (buffer) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.bufferSetOption(name, value, function (err, result) {
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
exports["bufferGetNumber'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.bufferGetNumber(function (err, result) {
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
exports["bufferGetName'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.bufferGetName(function (err, result) {
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
exports["bufferSetName'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.bufferSetName(name, function (err, result) {
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
exports["bufferIsValid'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.bufferIsValid(function (err, result) {
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
exports["bufferGetMark'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.bufferGetMark(name, function (err, result) {
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
exports["bufferAddHighlight'"] = function (buffer) {
  return function (src_id) {
    return function (hl_group) {
      return function (line) {
        return function (col_start) {
          return function (col_end) {
            return function (error) {
              return function (success) {
                return function () {
                  buffer.bufferAddHighlight(src_id, hl_group, line, col_start, col_end, function (err, result) {
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
}
exports["bufferClearHighlight'"] = function (buffer) {
  return function (src_id) {
    return function (line_start) {
      return function (line_end) {
        return function (error) {
          return function (success) {
            return function () {
              buffer.bufferClearHighlight(src_id, line_start, line_end, function (err, result) {
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
exports["tabpageGetWindows'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.tabpageGetWindows(function (err, result) {
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
exports["tabpageGetVar'"] = function (tabpage) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          tabpage.tabpageGetVar(name, function (err, result) {
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
exports["tabpageGetWindow'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.tabpageGetWindow(function (err, result) {
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
exports["tabpageIsValid'"] = function (tabpage) {
  return function (error) {
    return function (success) {
      return function () {
        tabpage.tabpageIsValid(function (err, result) {
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
exports["vimCommand'"] = function (vim) {
  return function (command) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimCommand(command, function (err, result) {
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
exports["vimFeedkeys'"] = function (vim) {
  return function (keys) {
    return function (mode) {
      return function (escape_csi) {
        return function (error) {
          return function (success) {
            return function () {
              vim.vimFeedkeys(keys, mode, escape_csi, function (err, result) {
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
exports["vimInput'"] = function (vim) {
  return function (keys) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimInput(keys, function (err, result) {
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
exports["vimReplaceTermcodes'"] = function (vim) {
  return function (str) {
    return function (from_part) {
      return function (do_lt) {
        return function (special) {
          return function (error) {
            return function (success) {
              return function () {
                vim.vimReplaceTermcodes(str, from_part, do_lt, special, function (err, result) {
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
exports["vimCommandOutput'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimCommandOutput(str, function (err, result) {
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
exports["vimEval'"] = function (vim) {
  return function (expr) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimEval(expr, function (err, result) {
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
exports["vimCallFunction'"] = function (vim) {
  return function (fname) {
    return function (args) {
      return function (error) {
        return function (success) {
          return function () {
            vim.vimCallFunction(fname, args, function (err, result) {
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
exports["vimStrwidth'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimStrwidth(str, function (err, result) {
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
exports["vimListRuntimePaths'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimListRuntimePaths(function (err, result) {
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
exports["vimChangeDirectory'"] = function (vim) {
  return function (dir) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimChangeDirectory(dir, function (err, result) {
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
exports["vimGetCurrentLine'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimGetCurrentLine(function (err, result) {
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
exports["vimSetCurrentLine'"] = function (vim) {
  return function (line) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimSetCurrentLine(line, function (err, result) {
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
exports["vimDelCurrentLine'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimDelCurrentLine(function (err, result) {
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
exports["vimGetVar'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimGetVar(name, function (err, result) {
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
exports["vimGetVvar'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimGetVvar(name, function (err, result) {
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
exports["vimGetOption'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimGetOption(name, function (err, result) {
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
exports["vimSetOption'"] = function (vim) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            vim.vimSetOption(name, value, function (err, result) {
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
exports["vimOutWrite'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimOutWrite(str, function (err, result) {
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
exports["vimErrWrite'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimErrWrite(str, function (err, result) {
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
exports["vimReportError'"] = function (vim) {
  return function (str) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimReportError(str, function (err, result) {
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
exports["vimGetBuffers'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimGetBuffers(function (err, result) {
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
exports["vimGetCurrentBuffer'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimGetCurrentBuffer(function (err, result) {
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
exports["vimSetCurrentBuffer'"] = function (vim) {
  return function (buffer) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimSetCurrentBuffer(buffer, function (err, result) {
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
exports["vimGetWindows'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimGetWindows(function (err, result) {
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
exports["vimGetCurrentWindow'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimGetCurrentWindow(function (err, result) {
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
exports["vimSetCurrentWindow'"] = function (vim) {
  return function (window) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimSetCurrentWindow(window, function (err, result) {
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
exports["vimGetTabpages'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimGetTabpages(function (err, result) {
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
exports["vimGetCurrentTabpage'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimGetCurrentTabpage(function (err, result) {
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
exports["vimSetCurrentTabpage'"] = function (vim) {
  return function (tabpage) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimSetCurrentTabpage(tabpage, function (err, result) {
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
exports["vimSubscribe'"] = function (vim) {
  return function (event) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimSubscribe(event, function (err, result) {
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
exports["vimUnsubscribe'"] = function (vim) {
  return function (event) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimUnsubscribe(event, function (err, result) {
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
exports["vimNameToColor'"] = function (vim) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          vim.vimNameToColor(name, function (err, result) {
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
exports["vimGetColorMap'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimGetColorMap(function (err, result) {
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
exports["vimGetApiInfo'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.vimGetApiInfo(function (err, result) {
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
exports["windowGetBuffer'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.windowGetBuffer(function (err, result) {
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
exports["windowGetCursor'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.windowGetCursor(function (err, result) {
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
exports["windowSetCursor'"] = function (window) {
  return function (pos) {
    return function (error) {
      return function (success) {
        return function () {
          window.windowSetCursor(pos, function (err, result) {
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
exports["windowGetHeight'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.windowGetHeight(function (err, result) {
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
exports["windowSetHeight'"] = function (window) {
  return function (height) {
    return function (error) {
      return function (success) {
        return function () {
          window.windowSetHeight(height, function (err, result) {
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
exports["windowGetWidth'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.windowGetWidth(function (err, result) {
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
exports["windowSetWidth'"] = function (window) {
  return function (width) {
    return function (error) {
      return function (success) {
        return function () {
          window.windowSetWidth(width, function (err, result) {
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
exports["windowGetVar'"] = function (window) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          window.windowGetVar(name, function (err, result) {
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
exports["windowGetOption'"] = function (window) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          window.windowGetOption(name, function (err, result) {
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
exports["windowSetOption'"] = function (window) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            window.windowSetOption(name, value, function (err, result) {
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
exports["windowGetPosition'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.windowGetPosition(function (err, result) {
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
exports["windowGetTabpage'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.windowGetTabpage(function (err, result) {
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
exports["windowIsValid'"] = function (window) {
  return function (error) {
    return function (success) {
      return function () {
        window.windowIsValid(function (err, result) {
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
