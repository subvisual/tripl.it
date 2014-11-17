Template.boxTrip.events
  'tap .Box-options': (e) ->
    e.preventDefault()
    e.stopPropagation()
    Trips.remove @id

  'tap .Box': ->
    IronBender.go('trips.show', { _id: @id }, { animation: 'slideLeft' })
