@Stickies = new Mongo.Collection "stickies"



Stickies.allow
  insert: (userId, doc) ->
    true

  update: (userId, doc) ->
    true

  remove: (userId, doc) ->
    if Stickies.find().count() < 2
      return false
    return true
