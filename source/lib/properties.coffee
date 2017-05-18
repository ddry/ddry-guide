###
# Module with deep properties structure example
###

'use strict'

module.exports =
  repeatFewTimes: (n, string = 'hi') ->
    Array(n * @.few + 1).join string

  setFew: (few) ->
    @.few = few

  wrapIt: (string) ->
    @.container += "|#{string}|"

  deep:
    deep:
      deep:
        inside:
          once: (string) ->
            @.repeatFewTimes 1, string
          
          twice: (string) ->
            @.repeatFewTimes 2, string

          thrice: (string) ->
            @.repeatFewTimes 3, string