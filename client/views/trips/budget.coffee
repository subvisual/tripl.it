currencies = [
  {value: "EUR", description: "Euros"},
  {value: "$US", description: "$ US Dollars"},
  {value: "GBP", description: "£ Pound Sterling"}
]

selectedCurrency = currencies[0]

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

  navigationAttributes: ->
    next: 'IconAdd'
    previous: 'IconBack'

Template.tripsBudget.events
  'tap #navigation-next': ->
    submit()

  'tap #navigation-previous': ->
    IronBender.go 'users.new', { _id: getRouterParams()._id }, { animation: 'slideRight' }

  'submit': (e) ->
    e.preventDefault()
    submit()

submit = ->
    amount = parseInt($('[name="amount"]').val())
    currency = $('[name="dropdown_selected"]').text()
    Trips.update { _id: getRouterParams()._id },
      $set:
        budgetAmount: amount,
        budgetCurrency: currency
    IronBender.go 'trips.show', { _id: getRouterParams()._id }, { animation: 'slideLeft' }
