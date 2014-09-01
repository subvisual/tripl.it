@Trips = new Meteor.Collection 'trip'

Trips.allow
  insert: (userId, trip) ->
    true
  update: () ->
    true
  remove: () ->
    true
