Meteor.publish "stickies", (boardName)->
  if boardName
    board = Boards.find({name: boardName})
    stickies = Stickies.find({boardId: board.fetch()[0]?._id})
    if board.count() and stickies.count()
      return [stickies, board]
    return []
  else
    return [Stickies.find({boardId:{$exists:false}})]
