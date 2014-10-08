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
  Meteor.subscribe 'trips'
  Meteor.subscribe 'expenses'

Router.map ->
  @route 'tripsIndex',
    path: '/'
    data: ->
      Trips.find {}, {sort: {createdAt: -1}}

  @route 'tripsAdd',
    path: 'trips/new'

  @route 'tripsShow',
    layoutTemplate: 'layoutWithHeader'
    path: 'trip/:_id'
    data: ->
      return Trips.findOne @params._id, transform: (trip) ->
        trip['expenses'] = Expenses.find {tripId: trip._id}, {sort: {createdAt: -1}}
        return trip

  @route 'usersNew',
    path: 'trip/:_id/users/new'

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

  @route 'expenseNew',
    path: 'trip/:_id/expenses/new'
    data: ->
      return Trips.findOne({_id: @params._id})

  @route 'lab',
    path: 'lab'
