Template.expensesIndex.helpers
  expenses: ->
    Expenses.find({ tripId: Session.get('currentTrip') })
