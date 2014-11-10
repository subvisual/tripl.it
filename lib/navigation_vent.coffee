class @Navigation
  @nextObservers = []
  @previousObservers = []

  @onNext: (f) =>
    @nextObservers.push f

  @onPrevious: (f) =>
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
