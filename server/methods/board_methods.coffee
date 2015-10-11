Meteor.methods
  "add_board": (name)->
    return false unless name
    if Boards.findOne({name: name})
      return false
    id = Boards.insert {name: name}
    Stickies.insert {boardId: id}
    return id
