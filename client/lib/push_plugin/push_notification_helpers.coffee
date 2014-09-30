@registerPushNotificationService = ->
  pushNotification = window.plugins.pushNotification
  if isAndroid()
    AndroidPushNotificationRegister.call()

isAndroid = ->
  platform = device.platform
  if platform is 'android' or platform is 'Android' or platform is 'amazon-fireos'
    true
  else
    false

@onNotification = (e) ->
  new window["Process#{camelize(e.event)}Notification"](e).call()

class @AndroidPushNotificationRegister
  call: ->
    debugger
    pushNotification.register _successHandler, _errorHandler,
      senderID: "664229378667"
      ecb: "onNotification"

  _sucessHandler: (result) ->
    console.log 'sucess' + result

  _errorHandler: (error) ->
    console.log 'error' + error

class @ProcessRegisteredNotification
  constructor: (event) ->
    @event = event

  call: ->
    console.log 'regID= ' + @event.regid
    if Meteor.user()
      Meteor.call('insertPushNotificationsKey', @event.regid)


class @ProcessMessageNotification
  constructor: (event) ->
    @event = event

  call: ->
    console.log _isForeground()
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
