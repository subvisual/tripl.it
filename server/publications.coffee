Meteor.publish 'trips', ->
  Trips.find()
#Meteor.publish 'trips', ->
  #Trips.find { users: { email: getEmailAddress(@userId) } }

Meteor.publish 'expenses', ->
  Expenses.find()
#Meteor.publish 'expenses', ->
  #userEmail = getEmailAddress(@userId)
  #trips = _.map Trips.find({ 'users.email' : userEmail }).fetch(), (trip) ->
    #return trip._id
  #Expenses.find { tripId: { $in: trips }}

#Meteor.publish 'users', ->
  #userEmail = getEmailAddress(@userId)
  #emails = _.map Trips.find({ 'users.email' : userEmail }).fetch(), (trip) ->
    #return _.map trip.users, (user) ->
      #return user.email
  #plainEmails = _.uniq _.reduceRight(emails, ((first, second) ->
      #return first.concat(second)
    #), [])
  #Meteor.users.find('emails.address': { $in: plainEmails }, { fields: { 'emails' : 1, 'profile' : 1 }})

#Meteor.publish 'notifications', ->
  #Notifications.find({ email: getEmailAddress(@userId) })

getEmailAddress = (userId) ->
  return Meteor.users.findOne(userId).emails[0].address
