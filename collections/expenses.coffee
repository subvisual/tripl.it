@Expenses = new Meteor.Collection 'expenses'

Expenses.allow
  insert: (userId, expense) ->
    true
  update: () ->
    true
  remove: () ->
    true
