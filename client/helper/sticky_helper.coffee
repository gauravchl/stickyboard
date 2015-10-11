@StickyHelper =
  updatePosition: (id, top, left) ->
    top = 0 if top < 0
    left = 0 if left < 0
    Stickies.update {_id : id}, $set:
      top: top
      left: left


  throttledUpdatePosition: throttle (id, top, left) ->
    StickyHelper.updatePosition id, top, left
  , 100, {leading:false}
