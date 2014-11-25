reactiveForm = new ReactiveForm

amountId = 'amount'
currencyId = 'currency'
currencies = [
  {value: "EUR", description: "Euros"},
  {value: "US", description: "$ US Dollars"},
  {value: "GBP", description: "£ Pound Sterling"}
]

Template.tripsBudget.created = ->
  reactiveForm.set(currencyId, currencies[0])

Template.tripsBudget.helpers
  currencyAttributes: ->
    list: currencies
    id: "currency"
    form: reactiveForm

  inputAttributes: ->
    placeholder: i18n('trips.budget.amountPlaceholder')
    type: "number"
    name: "amount"
    id: "amount"

  navigationAttributes: ->
    next: 'IconAdd'
    previous: 'IconBack'

  amount: ->
    reactiveForm.get(amountId)

Template.tripsBudget.events
  'tap #navigation-next': ->
    submit()

  'tap #navigation-previous': ->
    IronBender.go 'users.new', { _id: getRouterParams()._id }, { animation: 'slideRight' }

  'keyup [name="amount"]': (e) ->
    value = $(e.target).val()
    reactiveForm.set(amountId, value)

  'submit': (e) ->
    e.preventDefault()
    submit()

submit = ->
  amount = reactiveForm.get(amountId)
  currency = reactiveForm.get(currencyId).value

  Trips.update { _id: getRouterParams()._id },
    $set:
      budgetAmount: amount,
      budgetCurrency: currency
  IronBender.go 'trips.show', { _id: getRouterParams()._id }, { animation: 'slideLeft' }
