androidPlatforms = ['android', 'Android', 'amazon-fireos']

@DeviceHelpers = ->

DeviceHelpers.isAndroid = ->
  platform = device.platform
  if androidPlatforms.indexOf platform > -1
    true
