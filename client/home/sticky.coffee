Template.sticky.events
  "dragstart .sticky": (e) ->
    console.log "Drag start"



  "drag .sticky": (e) ->
    $ele = $(e.target)
    $ele.css "left": e.originalEvent.clientX, "top": e.originalEvent.clientY
    console.log "Dragging ", e.originalEvent.clientX, e.originalEvent.clientY



  "dragend .sticky": (e) ->
    console.log "drag ends"
