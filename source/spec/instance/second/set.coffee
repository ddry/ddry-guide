'use strict'

module.exports = (dd, that) ->
  dd.drive [
    matcher: 'property'
    it: 'Sets instance property'
    i: [ 'prop01',
      second:
        one: 1
        two: dd.helper.f ]
    e:
      "prop01.second.one": 1
      "prop01.second.two": dd.helper.f
    ]
