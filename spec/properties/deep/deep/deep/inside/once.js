// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return [1, 2, 3].forEach(function(n) {
      return dd.ry("With few set to " + n, [n], function() {
        return dd.drive([
          {
            before: function() {
              return this.few = n;
            },
            it: "Says '" + ('hi'.repeat(n)) + "' once",
            i: [],
            e: 'hi'.repeat(n)
          }, {
            it: "Says '" + ('blah'.repeat(n)) + "' once",
            i: ['blah'],
            e: 'blah'.repeat(n),
            after: function() {
              return delete this.few;
            }
          }
        ]);
      });
    });
  };

}).call(this);
