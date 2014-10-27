class @CreateNotification
  constructor: (@body, @email) ->

  call: =>
    Notifications.insert({ body: @body, email: @email })
