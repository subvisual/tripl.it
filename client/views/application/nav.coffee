Template.nav.helpers
    next: ->
        getNavigationForRoute(getCurrentRouteName()).next

    previous: ->
        getNavigationForRoute(getCurrentRouteName()).previous
