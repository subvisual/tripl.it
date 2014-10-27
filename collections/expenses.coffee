@Expenses = new Meteor.Collection 'expenses'

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
    new CreateExpense(params).call()

  removeExpense: (expenseId) ->
    return if !expenseId
    new RemoveExpense(expenseId).call()
