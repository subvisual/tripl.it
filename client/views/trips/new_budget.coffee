currencies = [
  {value: "EUR", description: "Euros"},
  {value: "$US", description: "$ US Dollars"},
  {value: "GBP", description: "£ Pound Sterling"}
]

selectedCurrency = currencies[0]

Template.budgetNew.created = () ->
  NavigationVent.subscribeToPrevious(_.bind(Template.budgetNew.cancel, this))
  NavigationVent.subscribeToNext(_.bind(Template.budgetNew.submit, this))

Template.budgetNew.helpers
  inputAttriutes: ->
    {
      placeholder: "Amount you plan to spend"
      type: "number"
      name: "amount"
    }

  currencies: ->
    currencies

  selectedCurrency: ->
    selectedCurrency

Template.budgetNew.submit = ->
  amount = $('#budget_amount').val()
  currency = $('#budget_currency').val()
  Trips.update { _id: getRouterParams()._id },
    $push:
      budgetAmount: amount,
      budgetCurrency: currency
  Router.go 'tripsShow', { _id: getRouterParams()._id }

Template.budgetNew.cancel = ->
  Router.go 'usersNew', { _id: getRouterParams()._id }

Template.budgetNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.budgetNew.submit()
