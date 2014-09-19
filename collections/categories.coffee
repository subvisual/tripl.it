categories = [
  {
    value: 'snacks'
    description: 'Snacks',
    image: '/img/icon-add.png'
  },
  {
    value: 'food'
    description: 'Food',
    image: '/img/icon-add.png'
  },
  {
    value: 'drinks'
    description: 'Drinks',
    image: '/img/icon-add.png'
  },
  {
    value: 'housing'
    description: 'Housing',
    image: '/img/icon-add.png'
  },
  {
    value: 'gas'
    description: 'Gas',
    image: '/img/icon-add.png'
  },
  {
    value: 'other'
    description: 'Other',
    image: '/img/icon-add.png'
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
