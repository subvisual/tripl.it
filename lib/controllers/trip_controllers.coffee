@TripsController = RouteController.extend
  data: ->
    name: i18n('trips.index.title')
    trips: Trips.find {}, { sort: { createdAt: -1 }}

@TripsShowController = RouteController.extend
  data: ->
    return Trips.findOne @params._id, transform: (trip) ->
      trip['expenses'] = Expenses.find {tripId: trip._id}, {sort: {createdAt: -1}}
      return trip

@TripsNewController = RouteController.extend
  data: ->
    name: i18n('trips.new.title')

@TripsBudgetController = RouteController.extend
  data: ->
    name: i18n('trips.budget.title')
