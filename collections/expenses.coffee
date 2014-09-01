@Expenses = new Meteor.Collection 'expenses'

Expenses.allow
  insert: (userId, expense) ->
    return !!expense.tripId && !!expense.description
