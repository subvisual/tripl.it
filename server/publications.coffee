Meteor.publish 'trips', ->
  email = Meteor.users.findOne(@userId).emails[0].address
  Trips.find({users: {email: email}})

Meteor.publish 'expenses', (tripId) ->
  Expenses.find({ tripId: tripId })

Meteor.publish 'users', ->
  Meteor.users.find()
