'use strict'

module.exports = (dd) ->
  [1..3].forEach (n) ->
    dd.ry "With few set to #{n}", [n], ->
      dd.drive [
        before: ->
          @.few = n
        it: "Says '#{'hi'.repeat 3*n}' once"
        i: []
        e: 'hi'.repeat 3*n
      ,
        it: "Says '#{'blah'.repeat 3*n}' once"
        i: [ 'blah' ]
        e: 'blah'.repeat 3*n
        after: ->
          delete @.few
      ]
