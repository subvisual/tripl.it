class @IronMime extends Router
  @go: (routeNameOrPath, params, options) ->
    if options && options.animation?
      Mime.animate(options.animation)
      delete options.animation

    super(routeNameOrPath, params, options)
