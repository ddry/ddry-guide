'use strict'

module.exports = (dd, that) ->
  dd.drive [
    matcher: 'property'
    it: 'Sets instance property'
    i: [ 'prop01',
      folder:
        second:
          one: 1
          two: dd.helper.f ]
    e:
      "prop01.folder.second.one": 1
      "prop01.folder.second.two": dd.helper.f
    ]
