Meteor.users.allow
  update: (userId) ->
    return this.userId == userId

Meteor.methods
  assignUserToTrip: (email, tripId) ->
    return if !email || !tripId

    user = findUserByEmail(email)

    if !user
      createUnenrolledUser(email)
      user = findUser(email)

    insertIntoTrip(user.id, tripId)

  insertPushNotificationsKey: (regId) ->
    Meteor.users.update
      _id: Meteor.userId()
    ,
      $set:
        profile:
          notificationsRegId: regId

findUserByEmail = (email) ->
  return Meteor.users.findOne
    emails:
      $elemMatch:
        address: email

createUnenrolledUser = (email) ->
  Accounts.createUser
    email: email
    password: Meteor.uuid()

insertIntoTrip = (userId, tripId) ->
  Trips.update
  _id: tripId
  ,
  $push:
    users:
      id: userId
