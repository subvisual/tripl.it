class @RemoveExpense
  constructor: (expenseId) ->
    @expense = Expenses.findOne(expenseId)

  call: =>
    @remove (err) =>
      if !err
        @updateBudget()

  remove: (cb) =>
    Expenses.remove { _id: @expense._id }, (err) =>
      cb(err)

  updateBudget: =>
    Trips.update {_id: @expense.tripId},
      $inc: {currentBudget: @expense.value * -1}
