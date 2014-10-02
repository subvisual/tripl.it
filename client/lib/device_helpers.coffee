androidPlatforms = ['android', 'Android', 'amazon-fireos']

@DeviceHelpers =
  isAndroid: ->
    _.contains(androidPlatforms, device.platform)
