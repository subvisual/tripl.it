currencies = [
  {value: "EUR", description: "Euros"},
  {value: "$US", description: "$ US Dollars"},
  {value: "GBP", description: "£ Pound Sterling"}
]

selectedCurrency = currencies[0]

Template.tripsBudget.created = () ->
  Navigation.onPrevious(_.bind(Template.tripsBudget.cancel, this))
  Navigation.onNext(_.bind(Template.tripsBudget.submit, this))

Template.tripsBudget.helpers
  inputAttributes: ->
    placeholder: "Amount you plan to spend"
    type: "number"
    name: "amount"
    id: "amount"

  currencies: ->
    currencies

  selectedCurrency: ->
    selectedCurrency

Template.tripsBudget.submit = ->
  amount = parseInt($('[name="amount"]').val())
  currency = $('[name="dropdown_selected"]').text()
  Trips.update { _id: getRouterParams()._id },
    $set:
      budgetAmount: amount,
      budgetCurrency: currency
  Router.go 'trips.show', { _id: getRouterParams()._id }

Template.tripsBudget.cancel = ->
  Router.go 'users.new', { _id: getRouterParams()._id }

Template.tripsBudget.events
  'submit': (e) ->
    e.preventDefault()
    Template.tripsBudget.submit()
