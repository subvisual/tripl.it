@Trips = new Mongo.Collection 'trips'

new GroundDB(Trips)

Trips.allow
  insert: (userId, trip) ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.methods
  createTrip: (name, tripId) ->
    Trips.insert
      _id: tripId
      name: name
    Meteor.call('assignLogedUserToTrip', tripId)
