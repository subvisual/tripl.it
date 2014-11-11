defaultNavigation =
  next: false
  previous: false

Actions =
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

  'trips.show': ->
    previous:
      icon: 'Back'

  'users.new': ->
    previous:
      icon: 'Back'
      route: 'trips.new'
    next:
      icon: 'Add'
      route: 'trips.budget'

  'users.index': ->
    next:
      icon: 'Add'
      route: 'users.new'

  'trips.budget': ->
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

  'lab': ->
    previous:
      icon: 'Back'
      route: 'trips.index'

class @NavigationActions
  @next: ->
    new NavigationActions(getCurrentRouteName()).call('next')

  @previous: ->
    new NavigationActions(getCurrentRouteName()).call('previous')

  constructor: (@routeName) ->

  call: (direction) =>
    @getActions()
    @parseDirection(direction)

  getActions: ->
    @actions = Actions[@routeName]
    if _.isFunction(@actions)
      @actions = @actions()

  parseDirection: (direction) ->
    if !@actions
      return {}

    action = @actions[direction]

    if _.isUndefined(action)
      action = {}

    if _.isFunction(action)
      action = action()

    if _.isFunction(action['route'])
      action.route = action.route()
    else if _.isString(action['route'])
      action.route = Router.path(action.route)

    _.defaults(action, {icon: false, route: false})
