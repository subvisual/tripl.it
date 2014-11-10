class @Navigation
  @_nextObservers = []
  @_previousObservers = []

  @onNext: (f) =>
    @_nextObservers.push f

  @onPrevious: (f) =>
    @_previousObservers.push f

  @notifyNext: =>
    _.each @_nextObservers, (f) ->
      f()
    @_nextObservers = []

  @notifyPrevious: =>
    _.each @_previousObservers, (f) ->
      f()
    @_previousObservers = []

  @reset: =>
    @_nextObservers = []
    @_previousObservers = []
