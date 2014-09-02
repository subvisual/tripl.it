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
    next:
      icon: 'Add'
      route: false
  tripsShow:
    previous:
      icon: 'Back'
      route: 'tripsIndex'
    next:
      icon: 'Add'
      route: 'expenseNew'

@getNavigationForRoute = (route) ->
  data = NavRoutes[route] || {}
  _.defaults(data, defaultNavigation)
