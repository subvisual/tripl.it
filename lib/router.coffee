Router.configure
  layoutTemplate: 'layout'

beforeHooks =
  isLoggedIn: ->
    if !Meteor.userId()
      Router.go 'signIn'
    @next()

  resetNavigationVent: ->
    NavigationVent.reset()
    @next()

Router.onBeforeAction beforeHooks.resetNavigationVent
Router.onBeforeAction beforeHooks.isLoggedIn,
  except: [ 'signIn', 'signUp', 'lab' ]

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

Router.map ->
  @route 'signUp',
    path: 'sign_up'

  @route 'signIn',
    path: 'sign_in'

  @route 'signOut',
    path: 'sign_out'
    action: ->
      Meteor.logout()

  #@route 'budgetNew',
    #path: 'trip/:_id/budget/new'
    #data: ->
      #name: i18n('trips.budget.title')

  @route 'lab',
    path: 'lab'
