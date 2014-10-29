defaultNavigation =
  next: false
  previous: false

@NavRoutes =
  'trips.index': ->
    next:
      icon: 'Add'
      route: 'trips.new'

  'trips.new': ->
    previous:
      icon: 'Back'
      route: 'trips.index'
    next:
      icon: 'Add'
      route: 'users.new'

  'trips.show': ->
    previous:
      icon: 'Back'
      route: 'trips.index'
    next: false

  'users.new': ->
    previous:
      icon: 'Back'
      route: 'trips.new'
    next:
      icon: 'Add'
      route: 'budgetNew'

  'users.index': ->
    previous: false
    next:
      icon: 'Add'
      route: 'users.new'

  budgetNew: ->
    previous:
      icon: 'Back'
      route: 'users.new'
    next:
      icon: 'Add'
      route: 'trips.show'

  'expenses.new': ->
    previous:
      icon: 'Back'
      route: false
    next:
      icon: 'Add'
      route: false

  signIn: ->
    previous: false
    next: false

  signUp: ->
    previous: false
    next: false

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
