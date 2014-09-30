Meteor.methods
  findUserByEmail: (email) ->
    user = Meteor.users.findOne
      emails:
        $elemMatch:
          address: email

    if user
      return user._id
