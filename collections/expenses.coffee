@Expenses = new Mongo.Collection 'expenses'

Expenses.before.insert (userId, doc) ->
  doc.createdAt = new Date

new GroundDB(Expenses)

Expenses.allow
  insert: (userId, expense) ->
    true
  update: () ->
    true
  remove: () ->
    true

Meteor.methods
  createExpense: (params) ->
    return if !params.tripId || !params.category || !params.value

    Expenses.insert params, (err, id) ->
      if !err
        Trips.update {_id: params.tripId}, {$inc: {currentBudget: params.value}}

  removeExpense: (expenseId) ->
    return if !expenseId

    expense = Expenses.findOne(expenseId)
    Expenses.remove {_id: expenseId}, (err) ->
      if !err
        Trips.update {_id: expense.tripId},
          $inc: {currentBudget: expense.value * -1}
