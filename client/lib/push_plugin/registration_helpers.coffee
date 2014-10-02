@registerPushNotificationService = ->
  if isAndroid()
    androidRegister()

androidRegister = ->
  pushNotification = window.plugins.pushNotification
  pushNotification.register successHandler, errorHandler,
    senderID: "664229378667"
    ecb: "onNotification"

isAndroid = ->
  platform = device.platform
  if platform is 'android' or platform is 'Android' or platform is 'amazon-fireos'
    true

successHandler = (result) ->
  console.log 'sucess' + result

errorHandler = (error) ->
  console.log 'error' + error
