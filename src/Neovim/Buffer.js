'use strict';

module.exports["lineCount'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.lineCount(function (err, result) {
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
module.exports["getLine'"] = function (buffer) {
  return function (index) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.getLine(index, function (err, result) {
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
module.exports["setLine'"] = function (buffer) {
  return function (index) {
    return function (line) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.setLine(index, line, function (err, result) {
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
module.exports["delLine'"] = function (buffer) {
  return function (index) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.delLine(index, function (err, result) {
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
module.exports["getLineSlice'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (include_start) {
        return function (include_end) {
          return function (error) {
            return function (success) {
              return function () {
                buffer.getLineSlice(start, end, include_start, include_end, function (err, result) {
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
module.exports["getLines'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (strict_indexing) {
        return function (error) {
          return function (success) {
            return function () {
              buffer.getLines(start, end, strict_indexing, function (err, result) {
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
module.exports["setLineSlice'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (include_start) {
        return function (include_end) {
          return function (replacement) {
            return function (error) {
              return function (success) {
                return function () {
                  buffer.setLineSlice(start, end, include_start, include_end, replacement, function (err, result) {
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
}
module.exports["setLines'"] = function (buffer) {
  return function (start) {
    return function (end) {
      return function (strict_indexing) {
        return function (replacement) {
          return function (error) {
            return function (success) {
              return function () {
                buffer.setLines(start, end, strict_indexing, replacement, function (err, result) {
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
module.exports["getVar'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.getVar(name, function (err, result) {
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
module.exports["setVar'"] = function (buffer) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.setVar(name, value, function (err, result) {
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
module.exports["delVar'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.delVar(name, function (err, result) {
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
module.exports["getOption'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.getOption(name, function (err, result) {
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
module.exports["setOption'"] = function (buffer) {
  return function (name) {
    return function (value) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.setOption(name, value, function (err, result) {
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
module.exports["getNumber'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.getNumber(function (err, result) {
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
module.exports["getName'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.getName(function (err, result) {
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
module.exports["setName'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.setName(name, function (err, result) {
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
module.exports["isValid'"] = function (buffer) {
  return function (error) {
    return function (success) {
      return function () {
        buffer.isValid(function (err, result) {
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
module.exports["insert'"] = function (buffer) {
  return function (lnum) {
    return function (lines) {
      return function (error) {
        return function (success) {
          return function () {
            buffer.insert(lnum, lines, function (err, result) {
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
module.exports["getMark'"] = function (buffer) {
  return function (name) {
    return function (error) {
      return function (success) {
        return function () {
          buffer.getMark(name, function (err, result) {
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
module.exports["addHighlight'"] = function (buffer) {
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
}
module.exports["clearHighlight'"] = function (buffer) {
  return function (src_id) {
    return function (line_start) {
      return function (line_end) {
        return function (error) {
          return function (success) {
            return function () {
              buffer.clearHighlight(src_id, line_start, line_end, function (err, result) {
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
