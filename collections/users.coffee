Meteor.methods
  assignUserToTrip: (email, tripId) ->
    return if !email || !tripId

    user = findUserByEmail(email)

    if !user
      createUnenrolledUser(email)
      user = findUser(email)

    insertIntoTrip(user.id, tripId)

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
