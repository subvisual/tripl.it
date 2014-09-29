@registerPushNotificationService = ->
  if DeviceHelpers.isAndroid()
    androidRegister()

androidRegister = ->
  pushNotification = window.plugins.pushNotification
  pushNotification.register successHandler, errorHandler,
    senderID: "664229378667"
    ecb: "onNotification"

successHandler = (result) ->
  console.log 'sucess' + result

errorHandler = (error) ->
  console.log 'error' + error
