class @NavigationVent
  @nextObservers = []
  @previousObservers = []

  @subscribeToNext: (f) =>
    @nextObservers.push f

  @subscribeToPrevious: (f) =>
    @previousObservers.push f

  @notifyNext: =>
    _.each @nextObservers, (f) ->
      f()
    @nextObservers = []

  @notifyPrevious: =>
    _.each @previousObservers, (f) ->
      f()
    @previousObservers = []

  @reset: =>
    @nextObservers = []
    @previousObservers = []
