Template.sticky.events
  "dragstart .sticky": (e) ->
    console.log "Drag start"



  "drag .sticky": (e) ->
    $ele = $(e.target)
    $ele.css "opacity": 0
    #console.log "Dragging ", e.originalEvent.clientX, e.originalEvent.clientY



  "dragend .sticky": (e) ->
    $ele = $(e.target)
    $ele.css "left": e.originalEvent.clientX - $ele.width()/2, "top": e.originalEvent.clientY - 12
    StickyHelper.updatePosition Template.currentData()._id, e.originalEvent.clientY - 12, e.originalEvent.clientX - $ele.width()/2

    $ele.css "opacity": 1
    console.log "Dragend ", e.originalEvent.clientX, e.originalEvent.clientY


  "focusout .content": (e) ->
    sticky = Template.currentData()
    $ele = $(e.currentTarget)
    content = $ele.html().trim()
    console.log "#GC focus out"
    if content != sticky.content
      Stickies.update sticky._id, $set:{ content: content }


  "click .remove": (e) ->
    Stickies.remove Template.currentData()._id


  "click .add": (e)->
    currentSticky = Template.currentData()
    Stickies.insert
      top: currentSticky.top + 12
      left: currentSticky.left + 12

  "click .change-color": (e)->
    currentHue = Template.currentData().hue
    if currentHue
      newHue = if currentHue > 350 then 0 else currentHue + 20
    else
      newHue = 1
    Stickies.update @_id, $set:{ hue: newHue }





Template.sticky.helpers
  stickyContent: ->
    container = Blaze.toHTMLWithData(Template.contentEditable, {content: @content})
    new Spacebars.SafeString(container)

  bg: ->
    if @hue
      return "hsla("+@hue+", 100%, 68%, 1)"
    return false


Template.contentEditable.helpers
  content: ->
    new Spacebars.SafeString(@content or "")


