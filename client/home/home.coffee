Template.board.events
  "dragover #board": (e)->
    e.preventDefault()

Template.board.helpers
  stickies: ->
    Stickies.find()
