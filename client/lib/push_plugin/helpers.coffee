@onNotification = (e) ->
  new window["Process#{camelize(e.event)}Notification"](e).call()

class @ProcessRegisteredNotification
  constructor: (event) ->
    @event = event

  call: ->
    if Meteor.user()
      Meteor.call('insertPushNotificationsKey', @event.regid)


class @ProcessMessageNotification
  constructor: (event) ->
    @event = event

  call: ->
    if _isForeground()
      _eventForegroundHandler()
    else
      console.log 'message = ' + @event.payload.message

  _isForeground = ->
    return if @event.foreground

  _eventForegroundHandler = ->
    console.log 'message = ' + @event.payload.message

    if _isColdstart()
      console.log 'coldstart'
    else
      console.log 'background'

  _isColdstart = ->
    @event.coldstart


class @ProcessErrorNotification
  constructor: (event) ->
    @event = event

  call: ->
    console.log 'error notification'
    if @event.event.equals 'error'
      console.log "error" + @event.msg
    else
      console.log "unknown"
