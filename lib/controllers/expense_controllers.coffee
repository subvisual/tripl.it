@ExpensesNewController = RouteController.extend
  data: ->
    trip: Trips.findOne({_id: @params._id}),

@ExpensesIndexController = RouteController.extend
  data: ->
    Debts.for(@params._id)
