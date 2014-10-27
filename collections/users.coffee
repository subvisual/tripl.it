customMethods =
  findByEmail: (email) ->
    return this.findOne
      emails:
        $elemMatch:
          address: email

_.extend Meteor.users, customMethods

Meteor.users.allow
  update: (userId) ->
    return this.userId == userId

Meteor.methods
  assignUserToTrip: (email, tripId) ->
    return if !email || !tripId
    new AssignToTrip(email, tripId).call()

  insertPushNotificationsKey: (regId) ->
    return if !regId
    new AddNotificationsKey(regId).call()
