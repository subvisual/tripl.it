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
  androidPlatforms = ['android', 'Android', 'amazon-fireos']
  if androidPlatforms.indexOf platform > -1
    true

successHandler = (result) ->
  console.log 'sucess' + result

errorHandler = (error) ->
  console.log 'error' + error
