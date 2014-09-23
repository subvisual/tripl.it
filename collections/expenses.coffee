@Expenses = new Mongo.Collection 'expenses'

new GroundDB(Expenses)

Expenses.allow
  insert: (userId, expense) ->
    true
  update: () ->
    true
  remove: () ->
    true
