Template.tripsIndex.helpers
  empty: ->
    @trips.count() >= 0

Template.tripsIndex.events
  'click #new_trip': (e) ->
    e.preventDefault()
    IronBender.go 'trips.new', {}, { animation: 'none' }
