posX = 0
posY = 0

Template.sticky.events
  "dragstart .sticky": (e) ->
    $ele = $(e.currentTarget)
    eve = e.originalEvent
    posX = eve.pageX - $ele.position().left
    posY = eve.pageY - $ele.position().top



  "drag .sticky": (e) ->
    $ele = $(e.target)
    $ele.css "opacity": 0
    eve = e.originalEvent
    StickyHelper.throttledUpdatePosition @_id, eve.pageY - posY, eve.pageX - posX



  "dragend .sticky": (e) ->
    $ele = $(e.target)
    $ele.css "opacity": 1




  "focusout .content": (e) ->
    sticky = Template.currentData()
    $ele = $(e.currentTarget)
    content = $ele.html().trim()
    if content != sticky.content
      Stickies.update sticky._id, $set:{ content: content }



  "click .remove": (e) ->
    Stickies.remove Template.currentData()._id



  "click .add": (e) ->
    currentSticky = Template.currentData()
    Stickies.insert
      top: currentSticky.top + 12
      left: currentSticky.left + 12



  "click .change-color": (e) ->
    currentHue = Template.currentData().hue
    if currentHue
      newHue = if currentHue > 350 then 0 else (currentHue + 20)
    else
      newHue = 1
    Stickies.update @_id, $set:{ hue: newHue }



Template.sticky.helpers
  stickyContent: ->
    container = Blaze.toHTMLWithData(Template.contentEditable, {content: @content})
    new Spacebars.SafeString(container)



  bg: ->
    if @hue
      return "hsla("+@hue+", 100%, 84%, 1)"
    return false



Template.contentEditable.helpers
  content: ->
    new Spacebars.SafeString(@content or "")


