Template.boxTrip.events
  'tap .Box-options': (e) ->
    e.preventDefault()
    e.stopPropagation()
    Trips.remove @id

  'tap .Box': ->
    Router.go Router.path('trips.show', { _id: @id })
