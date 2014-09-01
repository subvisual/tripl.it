defaultNavigation =
  next: false
  previous: false

NavRoutes =
  tripsIndex:
    next:
      icon: 'Add'
      route: 'tripsAdd'
  tripsAdd:
    previous:
      icon: 'Back'
      route: 'tripsIndex'
  tripsShow:
    previous:
      icon: 'Back'
      route: 'tripsIndex'

@getNavigationForRoute = (route) ->
  data = NavRoutes[route] || {}
  _.defaults(data, defaultNavigation)
