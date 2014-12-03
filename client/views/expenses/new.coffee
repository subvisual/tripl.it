valueId = 'value'
usersId = 'users'
categoryId = 'category'

reactiveForm = new ReactiveForm([valueId, usersId, categoryId])
categories = []

Meteor.startup ->
  categories = _.map Categories.all(), (category) ->
    upperCase = "#{category.value[0].toUpperCase()}#{category.value.slice(1)}"
    return _.extend({class: "Icon#{upperCase}"}, _.omit(category, 'image'))

Template.expensesNew.rendered = ->
  Bender.animate('slideOverUpClose')

Template.expensesNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.expensesNew.submit()

  'keyup [name="expense_value"]': (e) ->
    reactiveForm.set(valueId, $(e.target).val())

  'tap .IconAdd': ->
    Template.expensesNew.submit()

  'tap .IconClose': ->
    Router.go 'trips.show', { _id: getRouterParams()._id }

Template.expensesNew.helpers
  usersAttributes: ->
    form: reactiveForm
    id: usersId
    list: Trips.findOne(getRouterParams()._id).users

  categoryAttributes: ->
    form: reactiveForm
    id: categoryId
    list: categories

  navigationAttributes: ->
    if reactiveForm.valid()
      next: 'IconAdd is-success'
      previous: 'IconClose'
    else
      previous: 'IconClose'

Template.expensesNew.submit = ->
  value = parseInt(reactiveForm.get(valueId))
  category = reactiveForm.get(categoryId)
  payingUser = reactiveForm.get(usersId).email
  expenseParams =
    category: Categories.findById(category)
    tripId: getRouterParams()._id
    value: value
    user: payingUser

  Meteor.call('createExpense', expenseParams)
  Router.go 'trips.show', { _id: getRouterParams()._id }
  reactiveForm.clean()
