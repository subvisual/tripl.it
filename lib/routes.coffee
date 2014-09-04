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
      route: false
    next:
      icon: 'Add'
      route: 'tripsIndex'
  tripsShow:
    previous:
      icon: 'Back'
      route: 'tripsIndex'
    next:
      icon: 'Add'
      route: false
  expenseNew:
    previous:
      icon: 'Back'
      route: false
    next:
      icon: 'Add'
      route: false

@getNavigationForRoute = (route) ->
  data = NavRoutes[route] || {}
  _.defaults(data, defaultNavigation)
