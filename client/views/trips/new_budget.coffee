Template.budgetNew.created = () ->
  NavigationVent.subscribeToPrevious(_.bind(Template.budgetNew.cancel, this))
  NavigationVent.subscribeToNext(_.bind(Template.budgetNew.submit, this))

Template.budgetNew.submit = ->
  amount = $('#budget_amount').val()
  currency = $('#budget_currency').val()
  Trips.update { _id: getRouterParams()._id }, { $push: { budgetAmount: amount, budgetCurrency: currency } }
  Router.go 'tripsShow', { _id: getRouterParams()._id }

Template.budgetNew.cancel = ->
  Router.go 'usersNew', { _id: getRouterParams()._id }

Template.budgetNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.budgetNew.submit()
