'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns its report'
    i: []
    e: 'title: second title, message: second message'
  ,
    matcher: 'property'
    it: 'checks module property'
    i: []
    e: 
      title: 'second title'
  ,
    matcher: 'plain'
    it: 'has access to all instances'
    i: Object.keys dd.instances()
    e: [ 'first', 'folder', 'second' ]
  ]
