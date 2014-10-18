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
    Notifications.insert {body: body, userId: userId}

  makeNotificationRead: (id) ->
    Notifications.update {_id: id}, {read: true}
