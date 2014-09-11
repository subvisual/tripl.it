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
      route: 'usersNew'
  tripsShow:
    previous:
      icon: 'Back'
      route: 'tripsIndex'
    next:
      icon: 'Add'
      route: false
  usersNew:
    previous:
      icon: 'Back'
      route: 'tripsAdd'
    next:
      icon: 'Add'
      route: 'budgetNew'
  budgetNew:
    previous:
      icon: 'Back'
      route: 'usersNew'
    next:
      icon: 'Add'
      route: 'tripsShow'
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
