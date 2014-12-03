class @ReactiveForm
  dep: undefined
  map: {}

  constructor: (keys) ->
    @dep = new Tracker.Dependency
    @clean(keys)

  set: (key, value) =>
    @map[key] = value
    @dep.changed()

  get: (key) =>
    @dep.depend()
    @map[key]

  valid: (keys) =>
    @dep.depend()
    if !_.isArray(keys)
      keys = Object.keys(@map)
    _.every keys, ((key) -> !!@map[key]), this

  clean: (keys) =>
    @dep.changed()
    if !_.isArray(keys)
      keys = Object.keys(@map)
    @map[key] = undefined for key in keys
