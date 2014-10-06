Meteor.users.allow
  update: (userId) ->
    return this.userId == userId

Meteor.methods
  assignUserToTrip: (email, tripId) ->
    return if !email || !tripId
    assignUserToTrip(email, tripId)

  insertPushNotificationsKey: (regId) ->
    Meteor.users.update { _id: Meteor.userId() },
      $set:
        profile:
          notificationsRegId: regId

assignUserToTrip = (email, tripId) ->
  Trips.update { _id: tripId },
    $push: { users: { email: email }}

findUserByEmail = (email) ->
  return Meteor.users.findOne
    emails:
      $elemMatch:
        address: email

createUnenrolledUser = (email) ->
  Accounts.createUser
    email: email
    password: Meteor.uuid()
