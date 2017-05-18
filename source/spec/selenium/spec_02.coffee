'use strict'

module.exports = (dd, that) ->
  context "PhantomJS usecase testing with 'text' general matcher", ->
    before ->
      that.get "http://localhost:3333"

    after ->
      that.close()

    dd.drive
      it: (i, e) -> "#{i} tag contains #{e}"
      matcher: 'selenium_text'
      data: [
        i:
          'Header title':
            css: 'h1 span'
        e:
          'Brunch title': 'Brunch'
      ,
        i:
          'Header subtitle':
            css: 'h1 small'
        e:
          'Brunch subtitle': '• A simple demo'
      ,
        i:
          'Paragraph':
            css: 'h1 + p'
        e:
          'paragraph text': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
      ,
        i:
          'Subheader':
            css: 'h2'
        e:
          'ToDo list title': 'Things to do:'
      ,
        i:
          'First ToDo list item':
            css: 'ul#mainTodo li'
        e:
          'first ToDo': 'Learn Brunch'
      ,
        i:
          'Second ToDo list item':
            css: 'ul#mainTodo li+li'
        e:
          'second ToDo': 'Apply to my projects'
      ,
        i:
          'Third ToDo list item':
            css: 'ul#mainTodo li+li+li'
        e:
          'third ToDo': '…'
      ,
        i:
          'Fourth ToDo list item':
            css: 'ul#mainTodo li+li+li+li'
        e:
          'fourth ToDo': 'Profit!'
      ]
