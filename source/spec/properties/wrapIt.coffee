'use strict'

module.exports = (dd, that) ->
  if dd.helper.forMocha()
    context 'With Mocha hooks', ->
      before ->
        that.container = ''
      after ->
      delete that.container
      context "with 'az'", ->
        beforeEach ->
          that.container += 'a'
        afterEach ->
          that.container += 'z'
        context "with 'by'", ->
          beforeEach ->
            that.container += 'b'
          afterEach ->
            that.container += 'y'
          context "with 'cx'", ->
            beforeEach ->
              that.container += 'c'
            afterEach ->
              that.container += 'x'
            dd.drive [
              it: "wraps '1'"
              i: [ 1 ]
              e: 'abc|1|'
            ,
              it: "wraps '1' again"
              i: [ 2 ]
              e: 'abc|1|xyzabc|2|'
            ,
              it: "wraps '1' again and again"
              i: [ 3 ]
              e: 'abc|1|xyzabc|2|xyzabc|3|'
            ]

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
