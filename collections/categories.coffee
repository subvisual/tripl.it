categories = [
  {
    value: 'snacks'
    description: 'Snacks',
    image: '/img/payback-icon.svg'
  },
  {
    value: 'food'
    description: 'Food',
    image: '/img/food-icon.svg'
  },
  {
    value: 'drinks'
    description: 'Drinks',
    image: '/img/drink-icon.svg'
  },
  {
    value: 'housing'
    description: 'Housing',
    image: '/img/housing-icon.svg'
  },
  {
    value: 'gas'
    description: 'Gas',
    image: '/img/gas-icon.svg'
  },
  {
    value: 'other'
    description: 'Other',
    image: '/img/other-icon.svg'
  }
]

class @Categories
  @findById: (id) ->
    _.findWhere categories, { value: id }

  @each: (cb) ->
    _.each categories, (category) ->
      cb(category)

  @all: ->
    categories
