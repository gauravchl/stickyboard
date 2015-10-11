@Boards = new Mongo.Collection "boards"



Boards.allow
  insert: (userId, doc) ->
    return false



  update: (userId, doc) ->
    return false



  remove: (userId, doc) ->
    return false
