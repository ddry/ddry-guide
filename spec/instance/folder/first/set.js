// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        matcher: 'property',
        it: 'Sets instance property',
        i: [
          'prop01', {
            folder: {
              first: {
                one: 1,
                two: dd.helper.f
              }
            }
          }
        ],
        e: {
          "prop01.folder.first.one": 1,
          "prop01.folder.first.two": dd.helper.f
        }
      }
    ]);
  };

}).call(this);