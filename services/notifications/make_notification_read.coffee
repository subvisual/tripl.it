class @MakeNotificationRead
  constructor: (@id) ->
  call: =>
    Notifications.update {_id: @id}, {read: true}

