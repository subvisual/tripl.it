Template.expenseNew.created = () ->
  NavigationVent.subscribeToPrevious(_.bind(Template.expenseNew.cancel, this))
  NavigationVent.subscribeToNext(_.bind(Template.expenseNew.submit, this))

Template.expenseNew.submit = ->
  value = parseInt($('input[name="expense_value"]').val())
  categoryId = $('input[name="expense_category"]:checked').val()
  params =
    category: Categories.findById(categoryId)
    tripId: getRouterParams()._id
    value: value

  Meteor.call('createExpense', params)
  Router.go 'tripsShow', { _id: getRouterParams()._id }

Template.expenseNew.cancel = ->
  Router.go 'tripsShow', { _id: getRouterParams()._id }

Template.expenseNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.expenseNew.submit()

Template.expenseNew.helpers
  categories: ->
    Categories.all()
