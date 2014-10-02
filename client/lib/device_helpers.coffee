androidPlatforms = ['android', 'Android', 'amazon-fireos']

@DeviceHelpers =
  isAndroid: ->
    platform = device.platform
    _.contains(androidPlatforms, platform)
