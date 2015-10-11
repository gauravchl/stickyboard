@StickyHelper =
  updatePosition: (id, top, left) ->
    Stickies.update {_id : id}, $set:
      top: top
      left: left


  throttledUpdatePosition: throttle (id, top, left) ->
    StickyHelper.updatePosition id, top, left
  , 100
