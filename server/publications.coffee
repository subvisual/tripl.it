Meteor.publish 'trips', (options) ->
  Trips.find({}, options)

Meteor.publish 'trip', (id) ->
  id && Trips.find({_id: id})

Meteor.publish 'expenses', (tripId) ->
  tripId && Expenses.find({})
