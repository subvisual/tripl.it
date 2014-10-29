@getCurrentRouteName = ->
  Router.current().route.getName()

@getRouterParams = ->
  Router.current().params
