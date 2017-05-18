'use strict'

module.exports = (dd) ->
  dd.drive [
    matcher: 'property'
    it: 'sets the "few" property of this module'
    i: [ 100500 ]
    e:
      few: 100500
  ,
    it: 'and returns it'
    i: [ 100500 ]
    e: 100500
    after: ->
      delete @.few
  ]
