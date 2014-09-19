categories = [
  {
    id: 'snacks',
    value: 'snacks'
    description: 'Snacks',
    image: '/img/icon-add.png'
  },
  {
    id: 'food',
    value: 'food'
    description: 'Food',
    image: '/img/icon-add.png'
  },
  {
    id: 'drinks',
    value: 'drinks'
    description: 'Drinks',
    image: '/img/icon-add.png'
  },
  {
    id: 'housing',
    value: 'housing'
    description: 'Housing',
    image: '/img/icon-add.png'
  },
  {
    id: 'gas',
    value: 'gas'
    description: 'Gas',
    image: '/img/icon-add.png'
  },
  {
    id: 'other',
    value: 'other'
    description: 'Other',
    image: '/img/icon-add.png'
  }
]

class @Categories
  each: (cb) ->
    _.each categories, (category) ->
      cb(category)

  @all: ->
    categories
