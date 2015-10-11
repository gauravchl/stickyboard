Meteor.publish "stickies", ()->
  return [Stickies.find()]
