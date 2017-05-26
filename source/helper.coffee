###
# Spec helper
###

'use strict'

SpecHelper = ->
  true

SpecHelper.prototype.f = -> 1

SpecHelper.prototype.forMocha = ->
  typeof describe is 'function'

module.exports = SpecHelper
