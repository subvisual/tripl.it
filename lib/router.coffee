Router.configure
  layoutTemplate: 'layout'

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
      data = {
        trip: Trips.findOne @params._id
        expenses: Expenses.find {tripId: @params._id}
      }
