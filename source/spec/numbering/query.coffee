'use strict'

module.exports = (dd, that) ->
  dd.drive 
    it: (i, e) ->
      "formats #{i} key-value pairs: #{e}"
    data: [
      'key1=value1',
      'key1=value1&key2=value2',
      'key1=value1&key2=value2&key3=value3'
    ]
