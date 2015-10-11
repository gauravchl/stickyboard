@Stickies = new Mongo.Collection "stickies"



Stickies.allow
  insert: (userId, doc) ->
    if doc.boardId
      if Boards.findOne doc.boardId and Stickies.find({boardId: doc.boardId}).count() > 49
        return false
      return true
    else
      if Stickies.find({boardId:{$exists:false}}).count() > 9
        return false
      return true



  update: (userId, doc) ->
    true



  remove: (userId, doc) ->
    if doc.boardId
      if Stickies.find({boardId: doc.boardId}).count() < 2
        return false
      return true
    else
      if Stickies.find({boardId:{$exists:false}}).count() < 2
        return false
      return true
