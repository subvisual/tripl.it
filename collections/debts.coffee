class UserExpenses
  userMap: {}

  add: (expense) =>
    if !_.isUndefined(@userMap[expense.user])
      @userMap[expense.user] = @userMap[expense.user] + expense.value
    else
      @userMap[expense.user] = 0

class @Debts
  @for: (trip_id) ->
    expenses = Expenses.find({tripId: trip_id}).fetch()
    userExpenses = new UserExpenses()

    _.each expenses, userExpenses.add
