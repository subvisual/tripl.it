@UsersController = RouteController.extend
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

@UsersNewController = RouteController.extend
  data: ->
    name: i18n('users.new.title')
