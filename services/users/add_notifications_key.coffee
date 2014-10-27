class @AddNotificationsKey
  constructor: (@regId) ->
  call: =>
    Meteor.users.update { _id: Meteor.userId() },
      $set:
        profile:
          notificationsRegId: @regId
