categories = [
  {
    id: 'drinks',
    description: 'Drinks',
    image: '/img/icon-add.png'
  }
]

class @Categories
  each: (cb) ->
    _.each categories, (category) ->
      cb(category)

  @all: ->
    categories
