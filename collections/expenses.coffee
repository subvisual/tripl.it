@Expenses = new GroundDB 'expenses'

Expenses.allow
  insert: (userId, expense) ->
    true
  update: () ->
    true
  remove: () ->
    true
