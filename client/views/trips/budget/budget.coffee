reactiveForm = new ReactiveForm
amountId = 'amount'
currencyId = 'currency'

Template.tripsBudget.helpers
  currencyAttributes: ->
    form: reactiveForm
    id: currencyId

  inputAttributes: ->
    placeholder: i18n('trips.budget.amountPlaceholder')
    type: 'number'
    name: 'amount'
    id: 'amount'

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
