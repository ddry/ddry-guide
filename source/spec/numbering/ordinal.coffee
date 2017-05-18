'use strict'

module.exports = (dd) ->
  dd.drive [
    it: (i, e) -> "returns #{e} for #{i}"
    data: [ '1st', '2nd', '3rd', '4th' ]
  ,
    it: (i, e) -> "returns #{e} for #{i}"
    from: 11
    data: [ '11th', '12th', '13th' ]
  ,
    it: (i, e) -> "returns #{e} for #{i}"
    from: 21
    data: [ '21st', '22nd', '23rd' ]
  ]
