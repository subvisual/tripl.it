Router.configure
  layoutTemplate: 'layout'

Router.onBeforeAction ->
  NavigationVent.reset()

Router.map ->
  @route 'tripsIndex',
    path: '/'
    waitOn: ->
      Meteor.subscribe 'trips'
    data: ->
      Trips.find()

  @route 'tripsAdd',
    path: 'trips/new'

  @route 'tripsShow',
    layoutTemplate: 'layoutWithHeader'
    path: 'trip/:_id'
    waitOn: ->
      return [
        Meteor.subscribe 'trip', @params._id
        Meteor.subscribe 'expenses', @params._id
      ]
    data: ->
      {
        trip: Trips.findOne @params._id
        expenses: Expenses.find {tripId: @params._id}
      }

  @route 'usersNew',
    path: 'trip/:_id/users/new'

  @route 'expenseNew',
    path: 'trip/:_id/expenses/new'
    waitOn: ->
      Meteor.subscribe 'trip', @params._id

  @route 'lab',
    path: 'lab'
