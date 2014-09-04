Template.nav.events
    'click #navigation-next': ->
        NavigationVent.notifyNext()

    'click #navigation-previous': ->
        NavigationVent.notifyPrevious()

Template.nav.helpers
    next: ->
        getNavigationForRoute(getCurrentRouteName()).next

    previous: ->
        getNavigationForRoute(getCurrentRouteName()).previous
