enableNotifications = ->
  Session.set('browserNotifications', true)

Meteor.startup ->
  if !!Notification
    if Notification.permission == 'granted'
      enableNotification()
    else if Notification.permission == 'default'
      requestNotification = ->
        window.removeEventListener 'click', requestNotification
        Notification.requestPermission (status) ->
          if status == 'granted'
            enableNotifications()
      window.addEventListener 'click', requestNotification
