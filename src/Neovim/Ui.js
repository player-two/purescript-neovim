'use strict';

module.exports["attach'"] = function (width) {
  return function (height) {
    return function (enable_rgb) {
      return function (error) {
        return function (success) {
          return function () {
            width.attach(height, enable_rgb, function (err, result) {
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
module.exports["detach'"] = function (error) {
  return function (success) {
    return function () {
      .detach(function (err, result) {
        if (err) {
          error(err);
        } else {
          success(result);
        }
      });
    }
  }
}
module.exports["tryResize'"] = function (width) {
  return function (height) {
    return function (error) {
      return function (success) {
        return function () {
          width.tryResize(height, function (err, result) {
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
