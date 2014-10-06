Meteor.publish 'trips', ->
  Trips.find
    users:
      $elemMatch:
        id: this.userId

Meteor.publish 'trip', (id) ->
  Trips.find({ _id: id })

Meteor.publish 'expenses', (tripId) ->
  Expenses.find({ tripId: tripId})
