'use strict';

exports["lineCount'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.lineCount(function (err, result) {
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
exports["getLines'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (strict_indexing) {
        return function (error) {
          return function (success) {
            return function () {
              buffer.getLines(start, end, strict_indexing, function (err, result) {
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
exports["setLines'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (strict_indexing) {
        return function (replacement) {
          return function (error) {
            return function (success) {
              return function () {
                buffer.setLines(start, end, strict_indexing, replacement, function (err, result) {
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
exports["getVar'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.getVar(name, function (err, result) {
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
exports["setVar'"] = function (buffer) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.setVar(name, value, function (err, result) {
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
exports["delVar'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.delVar(name, function (err, result) {
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
exports["getOption'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.getOption(name, function (err, result) {
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
exports["setOption'"] = function (buffer) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.setOption(name, value, function (err, result) {
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
exports["getNumber'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.getNumber(function (err, result) {
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
exports["getName'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.getName(function (err, result) {
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
exports["setName'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.setName(name, function (err, result) {
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
exports["isValid'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.isValid(function (err, result) {
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
exports["getMark'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.getMark(name, function (err, result) {
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
exports["addHighlight'"] = function (buffer) {
  return function (src_id) {
    return function (hl_group) {
      return function (line) {
        return function (col_start) {
          return function (col_end) {
            return function (error) {
              return function (success) {
                return function () {
                  buffer.addHighlight(src_id, hl_group, line, col_start, col_end, function (err, result) {
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
exports["clearHighlight'"] = function (buffer) {
  return function (src_id) {
    return function (line_start) {
      return function (line_end) {
        return function (error) {
          return function (success) {
            return function () {
              buffer.clearHighlight(src_id, line_start, line_end, function (err, result) {
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
