defaultNavigation =
  next: false
  previous: false

@NavRoutes =
  tripsIndex: ->
    next:
      icon: 'Add'
      route: 'tripsAdd'

  tripsAdd: ->
    previous:
      icon: 'Back'
      route: false
    next:
      icon: 'Add'
      route: 'usersNew'

  tripsShow: ->
    previous:
      icon: 'Back'
      route: 'tripsIndex'
    next: ->
      id = getRouterParams()._id
      return {
        route: Router.path('expenseNew', { _id: id })
        icon: 'Add'
      }

  usersNew: ->
    previous:
      icon: 'Back'
      route: 'tripsAdd'
    next:
      icon: 'Add'
      route: 'budgetNew'

  budgetNew: ->
    previous:
      icon: 'Back'
      route: 'usersNew'
    next:
      icon: 'Add'
      route: 'tripsShow'

  expenseNew: ->
    previous:
      icon: 'Back'
      route: false
    next:
      icon: 'Add'
      route: false

  lab: ->
    previous: false
    next: false

parseNavigationParams = (params) ->
  if _.isFunction(params)
    params = params()
  else if params && params.route && _.isString(params.route)
    params.route = Router.path(params.route)
  return params

@getNavigationForRoute = ->
  map = NavRoutes[getCurrentRouteName()]()
  map = { next: false, previous: false } if !map

  map.next = parseNavigationParams(map.next)
  map.previous = parseNavigationParams(map.previous)

  return map

