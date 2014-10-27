@Notifications = new Meteor.Collection 'notifications'

Notifications.before.insert (userId, doc) ->
  doc.read = false
  doc.createdAt = new Date

Notifications.allow
  insert: (userId, notification) ->
    true
  update: ->
    true

Meteor.methods
  createNotification: (body, userId) ->
    new CreateNotification(body, userId).call()

  makeNotificationRead: (id) ->
    new MakeNotificationRead(id).call()
