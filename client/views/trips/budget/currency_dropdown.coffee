currencies = [
  {value: 'EUR', description: 'Euros'},
  {value: 'US', description: '$ US Dollars'},
  {value: 'GBP', description: '£ Pound Sterling'}
]

Template.currencyDropdown.created = ->
  @data.form.set(@data.id, currencies[0])

Template.currencyDropdown.helpers
  currencyAttributes: ->
    form: @form
    id: @id
    itemTemplate: 'currencyItem'
    label: 'Select your currency'
    list: currencies
    selectedTemplate: 'currencySelected'
