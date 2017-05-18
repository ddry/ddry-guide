'use strict'

module.exports = (dd) ->
  dd.context 'With ddry hooks', ->
    dd.drive [
      before: ->
        @.container = 'abc'
      it: "wraps '1'"
      i: [ 1 ]
      e: 'abc|1|'
      after: ->
        @.container += 'xyz'
    ,
      before: ->
        @.container += 'abc'
      after: ->
        @.container += 'xyz'
    ,
      it: "wraps '1' again"
      i: [ 2 ]
      e: 'abc|1|xyzabc|2|'
    ,
      it: "wraps '1' again and again"
      i: [ 3 ]
      e: 'abc|1|xyzabc|2|xyzabc|3|'
      after: ->
        delete @.container
    ]
