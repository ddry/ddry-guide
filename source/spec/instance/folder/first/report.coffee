'use strict'

module.exports = (dd, that) ->
  dd.drive [
    it: 'returns its report'
    i: []
    e: 'title: first folder title, message: first folder message'
  ,
    matcher: 'property'
    it: 'checks module property'
    i: []
    e: 
      title: 'first folder title'
  ,
    matcher: 'plain'
    it: 'has access to all instances'
    i: Object.keys dd.instances()
    e: [ 'first', 'folder', 'second' ]
  ]
