Meteor.methods
  assignUserToTrip: (email, tripId) ->
    return if !email || !tripId

    user = findUser(email)

    if !user
      createUserWithNoPassword(email)
      user = findUser(email)

    debugger

    Trips.update
      _id: tripId
      ,
        $push:
          users:
            id: user._id


findUser = (email) ->
  return Meteor.users.findOne
    emails:
      $elemMatch:
        address: email

createUserWithNoPassword = (email) ->
  Accounts.createUser
    email: email
    password: Meteor.uuid()
