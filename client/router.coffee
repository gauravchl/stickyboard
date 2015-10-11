
Router.map ->
  @route "root",
    path: "/"
    template: 'board'
    layoutTemplate: 'empty_layout'
    subscriptions: ->  Meteor.subscribe "stickies"


  @route "notFound",
    path: '/(.*)'
    onBeforeAction: ()->
      Router.go "root"
