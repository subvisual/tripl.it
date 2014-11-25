reactiveForm = new ReactiveForm
usersId = 'users'

Template.expensesNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.expensesNew.submit()

  'tap #navigation-next': ->
    Template.expensesNew.submit()

  'tap #navigation-previous': ->
    IronBender.go 'trips.show', { _id: getRouterParams()._id }, { animation: 'slideOverUpClose' }

Template.expensesNew.helpers
  usersAttributes: ->
    form: reactiveForm
    id: usersId
    list: Trips.findOne(getRouterParams()._id).users

  navigationAttributes: ->
    next: 'IconAdd'
    previous: 'IconBack'

  categories: ->
    return _.map Categories.all(), (category) ->
      upperCase = "#{category.value[0].toUpperCase()}#{category.value.slice(1)}"
      return _.extend({class: "Icon#{upperCase}"}, _.omit(category, 'image'))

Template.expensesNew.submit = ->
  value = parseInt($('input[name="expense_value"]').val())
  categoryId = $('input[name="expense_category"]:checked').val()
  payingUser = reactiveForm.get(usersId).email
  params =
    category: Categories.findById(categoryId)
    tripId: getRouterParams()._id
    value: value
    user: payingUser

  Meteor.call('createExpense', params)
  IronBender.go 'trips.show', { _id: getRouterParams()._id }, { animation: 'slideOverUpClose' }
