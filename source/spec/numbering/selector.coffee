'use strict'

module.exports = (dd) ->
  dd.drive
    it: (i, e) ->
      "returns #{e} for #{i[0]} '#{i[1]}' tags"
    data: [
      i: []
      e: 'li'
    ,
      i: [ 5, null ]
      e: 'li+li+li+li+li'
    ,
      i: [ 2, 'div' ]
      e: 'div+div'
    ]
