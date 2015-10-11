Template.board.events
  "dragover #board": (e)->
    e.preventDefault()



  "click .add-board": (e) ->
    boardName = $(".new-board-name").val().trim()
    unless  boardName
      return false
    else
      Meteor.call "add_board", boardName, (e, r)->
        console.log r
        if r
          Router.go 'board', {boardName:boardName}



Template.board.helpers
  stickies: ->
    Stickies.find()


