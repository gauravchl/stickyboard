
Router.map ->
  @route "root",
    path: "/"
    template: 'board'
    layoutTemplate: 'empty_layout'
    subscriptions: ->  Meteor.subscribe "stickies"
    action: ()->
      if @ready()
        document.title = "Sticky"
        @render()
      else
        document.title = "Loading..."



  @route "notFound",
    path: '/(.*)'
    onBeforeAction: ()->
      Router.go "root"
