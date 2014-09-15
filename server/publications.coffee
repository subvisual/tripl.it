Meteor.publish 'trips', ->
  Trips.find({})

Meteor.publish 'trip', (id) ->
  Trips.find({ _id: id })

Meteor.publish 'expenses', (tripId) ->
  Expenses.find({ tripId: tripId})

Meteor.publish 'users', ->
  Meteor.users.find()
