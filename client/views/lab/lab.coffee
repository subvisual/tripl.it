currencies = [
  {value: "EUR", description: "€ Euros"},
  {value: "$US", description: "$ US Dollars"},
  {value: "GBP", description: "£ Pound Sterling"}
]

selectedCurrency = null

Template.lab.helpers
    currencies: ->
        currencies

    selectedCurrency: ->
        selectedCurrency || currencies[0]

    dropdownData: ->
        [{value: 1, description: 'Random'}, {value: 2, description: 'Random 2'}]

    categories: ->
      Categories.all()
