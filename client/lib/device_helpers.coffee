androidPlatforms = ['android', 'Android', 'amazon-fireos']

@DeviceHelpers =
  isCordova: ->
    return window.device != undefined

  isAndroid: ->
    if DeviceHelpers.isCordova()
      _.contains(androidPlatforms, device.platform)
