Router.configure
  layoutTemplate: 'layout'

beforeHooks =
  isLoggedIn: ->
    if !Meteor.userId()
      Router.go 'sign.in'
    @next()

  resetNavigation: ->
    Navigation.reset()
    @next()

#Router.onBeforeAction beforeHooks.resetNavigation
Router.onBeforeAction beforeHooks.isLoggedIn,
  except: [ 'sign.in', 'sign.up', 'lab' ]

if Meteor.isClient
  subscribed = false
  Tracker.autorun () ->
    if Meteor.user() && !subscribed
      Meteor.subscribe 'users'
      Meteor.subscribe 'trips'
      Meteor.subscribe 'expenses'
      Meteor.subscribe 'notifications'
      subscribed = true

Router.route '/',
  name: 'trips.index'
  controller: 'TripsController'

Router.route 'trip/:_id',
  name: 'trips.show'
  controller: 'TripsShowController'

Router.route 'trips/new',
  name: 'trips.new'
  controller: 'TripsNewController'

Router.route 'trips/:_id/users',
  name: 'users.index'
  controller: 'UsersController'

Router.route 'trips/:_id/users/new',
  name: 'users.new'
  controller: 'UsersNewController'

Router.route 'trip/:_id/expenses/new',
  name: 'expenses.new'
  controller: 'ExpensesNewController'

Router.route 'trip/:_id/budget/new',
  name: 'trips.budget'
  controller: 'TripsBudgetController'

Router.route 'sign_in',
  name: 'sign.in'

Router.route 'sign_out', ->
  Meteor.logout()
  @render('sign.out')

Router.route 'sign_up',
  name: 'sign.up'

Router.route 'lab',
  name: 'lab'
