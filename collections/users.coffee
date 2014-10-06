Meteor.users.allow
  update: (userId) ->
    return this.userId == userId

Meteor.methods
  assignUserToTrip: (email, tripId) ->
    return if !email || !tripId

    userId = Meteor.call('findUserByEmail', email)

    if !userId
      createUnenrolledUser(email)
      userId = Meteor.call('findUserByEmail', email)

    insertIntoTrip(userId, tripId)

  assignLogedUserToTrip: (tripId) ->
    insertIntoTrip(Meteor.userId(), tripId)

  insertPushNotificationsKey: (regId) ->
    Meteor.users.update
      _id: Meteor.userId()
    ,
      $set:
        profile:
          notificationsRegId: regId


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
