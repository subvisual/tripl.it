Template.tripsIndex.helpers
  empty: ->
    @trips.count() == 0

  navigationAttributes: ->
    next: 'IconAdd'


Template.tripsIndex.events
  'tap #new_trip': (e) ->
    e.preventDefault()
    IronBender.go 'trips.new', {}, { animation: 'none' }

  'tap #navigation-next': ->
    IronBender.go 'trips.new', {}, { animation: 'slideLeft' }
