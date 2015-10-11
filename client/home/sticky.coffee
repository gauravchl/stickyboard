Template.sticky.events
  "dragstart .sticky": (e) ->
    console.log "Drag start"



  "drag .sticky": (e) ->
    $ele = $(e.target)
    $ele.css "opacity": 0
    console.log "Dragging ", e.originalEvent.clientX, e.originalEvent.clientY



  "dragend .sticky": (e) ->
    $ele = $(e.target)
    $ele.css "left": e.originalEvent.clientX - $ele.width()/2, "top": e.originalEvent.clientY - 12
    $ele.css "opacity": 1
    console.log "drag ends"
