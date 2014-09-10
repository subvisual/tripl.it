Template.expenseNew.created = () ->
  NavigationVent.subscribeToPrevious(_.bind(Template.expenseNew.cancel, this))
  NavigationVent.subscribeToNext(_.bind(Template.expenseNew.submit, this))

Template.expenseNew.submit = ->
  description = $('#expense_description').val()
  Expenses.insert
    description: description
    tripId: getRouterParams()._id
  Router.go 'tripsShow', { _id: getRouterParams()._id }

Template.expenseNew.cancel = ->
  Router.go 'tripsShow', { _id: getRouterParams()._id }

Template.expenseNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.expenseNew.submit()
