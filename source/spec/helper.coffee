###
# Spec helper
###

'use strict'

SpecHelper = ->
  true

SpecHelper.prototype.forMocha = ->
  typeof describe is 'function'

module.exports = SpecHelper