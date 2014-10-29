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

Router.map ->
  @route 'usersNew',
    path: 'trip/:_id/users/new'
    data: ->
      name: i18n('users.new.title')

  @route 'usersIndex',
    path: 'trips/:_id/users'
    data: ->
      trip = Trips.findOne(@params._id)
      users = new Array
      _.each trip.users, (user) ->
        foundUser = Meteor.users.findOne({ email: user.email })
        if foundUser
          users.push foundUser
        else
          users.push user

      trip: trip
      users: users
      name: i18n('users.index.title')

  @route 'signUp',
    path: 'sign_up'

  @route 'signIn',
    path: 'sign_in'

  @route 'signOut',
    path: 'sign_out'
    action: ->
      Meteor.logout()

  @route 'budgetNew',
    path: 'trip/:_id/budget/new'
    data: ->
      name: i18n('trips.budget.title')

  @route 'expenseNew',
    path: 'trip/:_id/expenses/new'
    data: ->
      trip: Trips.findOne({_id: @params._id}),
      name: i18n('expenses.new.title')

  @route 'lab',
    path: 'lab'
