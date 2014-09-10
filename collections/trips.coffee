@Trips = new GroundDB 'trip'

Trips.allow
  insert: (userId, trip) ->
    true
  update: () ->
    true
  remove: () ->
    true
