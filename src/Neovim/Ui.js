'use strict';

exports["attach'"] = function (vim) {
  return function (width) {
    return function (height) {
      return function (enable_rgb) {
        return function (error) {
          return function (success) {
            return function () {
              vim.attach(width, height, enable_rgb, function (err, result) {
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
exports["detach'"] = function (vim) {
  return function (error) {
    return function (success) {
      return function () {
        vim.detach(function (err, result) {
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
exports["tryResize'"] = function (vim) {
  return function (width) {
    return function (height) {
      return function (error) {
        return function (success) {
          return function () {
            vim.tryResize(width, height, function (err, result) {
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
