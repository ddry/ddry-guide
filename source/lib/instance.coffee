###
# Instance module example
###

'use strict'

Instance = (title, message) ->
  @.title = title
  @.message = message

Instance.prototype.set = (property, value) ->
  @[property] = value

Instance.prototype.report = ->
  report = []
  for key, value of @
    report.push "#{key}: #{value}" unless typeof value is 'function'
  report.join ', '

module.exports = Instance