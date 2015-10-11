
Router.map ->
  @route "root",
    path: "/"
    template: 'board'
    layoutTemplate: 'empty_layout'


  @route "notFound",
    path: '/(.*)'
    onBeforeAction: ()->
      Router.go "root"
