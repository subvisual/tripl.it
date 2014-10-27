Meteor.publish 'trips', ->
  Trips.find { users: { email: getEmailAddress(@userId) } }

Meteor.publish 'expenses', ->
  email = getEmailAddress(@userId)
  trips = _.map Trips.find({ users: { email: email }}).fetch(), (trip) ->
    return trip._id
  Expenses.find { tripId: { $in: trips }}

Meteor.publish 'users', ->
  Meteor.users.find()

Meteor.publish 'notifications', ->
  Notifications.find({ email: getEmailAddress(@userId) })

getEmailAddress = (userId) ->
  return Meteor.users.findOne(userId).emails[0].address
