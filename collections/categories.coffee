categories = [
  {
    value: 'payback'
    description: 'Payback'
  },
  {
    value: 'food'
    description: 'Food'
  },
  {
    value: 'drink'
    description: 'Drinks'
  },
  {
    value: 'housing'
    description: 'Housing'
  },
  {
    value: 'gas'
    description: 'Gas'
  },
  {
    value: 'other'
    description: 'Other'
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
