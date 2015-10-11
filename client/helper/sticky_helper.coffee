@StickyHelper =
  updatePosition: (id, top, left) ->
    Stickies.update {_id : id}, $set:
      top: top
      left: left
