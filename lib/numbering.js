// Generated by CoffeeScript 1.12.6

/*
 * Numbering module example
 */

(function() {
  'use strict';
  module.exports = {
    ordinal: function(n) {
      var index;
      index = ~~(n / 10 % 10) - 1 ? n % 10 : 0;
      return n + ([false, 'st', 'nd', 'rd'][index] || 'th');
    },
    range: function(from, to) {
      var cursor, i, j, len, range, ref;
      range = [];
      cursor = from;
      ref = Array(to - from + 1);
      for (j = 0, len = ref.length; j < len; j++) {
        i = ref[j];
        range.push(cursor);
        cursor += 1;
      }
      return range;
    },
    query: function(limit) {
      return this.range(1, limit).map(function(number) {
        return "key" + number + "=value" + number;
      }).join('&');
    },
    selector: function(limit, tag) {
      if (limit == null) {
        limit = 1;
      }
      if (tag == null) {
        tag = 'li';
      }
      return tag + Array(limit).join("+" + tag);
    }
  };

}).call(this);
