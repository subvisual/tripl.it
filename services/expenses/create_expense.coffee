class @CreateExpense
  constructor: (@params) ->

  call: =>
    @insert (err) =>
      if !err
        @updateBudget()
        @createNotifications()

  insert: (cb) =>
    Expenses.insert @params, (err, id) =>
      cb(err, id)

  updateBudget: =>
    Trips.update({ _id: @params.tripId }, { $inc: { currentBudget: @params.value }})

  createNotifications: =>
    trip = Trips.findOne({ _id: @params.tripId })
    _.each trip.users, (user) =>
      new CreateNotification("New Notification", user.email).call()
