class @ReactiveForm
  @dep = undefined
  @map = {}

  constructor: (selected) ->
    @dep = new Tracker.Dependency
    @map = {}

  set: (key, value) =>
    @map[key] = value
    @dep.changed()

  get: (key) =>
    @dep.depend()
    @map[key]
