Template.expensesNew.created = () ->
  Navigation.onNext(_.bind(Template.expensesNew.submit, this))

Template.expensesNew.submit = ->
  value = parseInt($('input[name="expense_value"]').val())
  categoryId = $('input[name="expense_category"]:checked').val()
  payingUser = $('[name="expense_paying"]').val()
  params =
    category: Categories.findById(categoryId)
    tripId: getRouterParams()._id
    value: value
    user: payingUser

  Meteor.call('createExpense', params)
  IronBender.go 'trips.show', { _id: getRouterParams()._id }, { animation: 'slideOverUpClose' }

Template.expensesNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.expensesNew.submit()

  'tap #navigation-previous': ->
    IronBender.go 'trips.show', { _id: getRouterParams()._id }, { animation: 'slideOverUpClose' }

Template.expensesNew.helpers
  navigationAttributes: ->
    next: 'IconAdd'
    previous: 'IconBack'

  categories: ->
    return _.map Categories.all(), (category) ->
      upperCase = "#{category.value[0].toUpperCase()}#{category.value.slice(1)}"
      return _.extend({class: "Icon#{upperCase}"}, _.omit(category, 'image'))
