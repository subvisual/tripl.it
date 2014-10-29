@ExpensesNewController = RouteController.extend
  data: ->
    trip: Trips.findOne({_id: @params._id}),
    name: i18n('expenses.new.title')
