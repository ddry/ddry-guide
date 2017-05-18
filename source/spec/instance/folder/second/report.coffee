'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns its report'
    i: []
    e: 'title: second folder title, message: second folder message'
  ,
    matcher: 'property'
    it: 'checks module property'
    i: []
    e: 
      title: 'second folder title'
  ,
    matcher: 'plain'
    it: 'has access to all instances'
    i: Object.keys dd.instances()
    e: [ 'first', 'folder', 'second' ]
  ]
