PreviousObservers = []
NextObservers = []

notifyNextAction = ->
    _.each PreviousObservers, (f) ->
        f()
    PreviousObservers = []

notifyPreviousAction = ->
    _.each PreviousObservers, (f) ->
        f()
    PreviousObservers = []

resetObservers = ->
    PreviousObservers = []
    NextObservers = []

@subscribeToNextAction = (f) ->
    NextObservers.push f

@subscribeToPreviousAction = (f) ->
    PreviousObservers.push f

Template.nav.events
    'click #navigation-next': ->
        notifyNextAction()

    'click #navigation-previous': ->
        notifyPreviousAction()

Template.nav.helpers
    next: ->
        getNavigationForRoute(getCurrentRouteName()).next

    previous: ->
        getNavigationForRoute(getCurrentRouteName()).previous
