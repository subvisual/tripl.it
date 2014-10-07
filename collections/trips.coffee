@Trips = new Mongo.Collection 'trips'

Trips.before.insert (userId, doc) ->
  doc.createdAt = new Date

new GroundDB(Trips)

Trips.allow
  insert: (userId, trip) ->
    true
  update: () ->
    true
  remove: () ->
    true
