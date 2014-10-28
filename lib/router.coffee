Router.configure
  layoutTemplate: 'layout'

beforeHooks =
  isLoggedIn: ->
    if !Meteor.userId()
      Router.go 'signIn'

  resetNavigationVent: ->
    NavigationVent.reset()

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

Router.map ->
  @route 'tripsIndex',
    path: '/'
    data: ->
      return {
        trips: Trips.find {}, { sort: { createdAt: -1 }}
        name: i18n('trips.index.title')
      }

  @route 'tripsAdd',
    path: 'trips/new'
    data: ->
      return {
        name: i18n('trips.new.title')
      }

  @route 'tripsShow',
    layoutTemplate: 'layoutWithHeader'
    path: 'trip/:_id'
    data: ->
      return Trips.findOne @params._id, transform: (trip) ->
        trip['expenses'] = Expenses.find {tripId: trip._id}, {sort: {createdAt: -1}}
        return trip

  @route 'usersNew',
    path: 'trip/:_id/users/new'
    data: ->
      return {
        name: i18n('users.new.title')
      }

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

      return {
        trip: trip
        users: users
        name: i18n('users.index.title')
      }

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
      return {
        name: i18n('trips.budget.title')
      }

  @route 'expenseNew',
    path: 'trip/:_id/expenses/new'
    data: ->
      return {
        trip: Trips.findOne({_id: @params._id}),
        name: i18n('expenses.new.title')
      }

  @route 'lab',
    path: 'lab'
