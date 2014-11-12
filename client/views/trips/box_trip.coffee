Template.boxTrip.events
  'tap .Box-options': (e) ->
    e.preventDefault()
    e.stopPropagation()
    Trips.remove @id

  'tap .Box': ->
    IronMime.go('trips.show', { _id: @id }, { animation: 'slideDown' })
