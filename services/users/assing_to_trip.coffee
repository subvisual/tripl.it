class @AssignToTrip
  constructor: (@email, @tripId) ->

  call: =>
    Trips.update { _id: @tripId },
      $push: { users: { email: @email }}
