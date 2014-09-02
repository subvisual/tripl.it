Template.nav.events
    'click #navigation-next': ->
        NavigationVent.notifyNext()

    'click #navigation-previous': ->
        NavigationVent.notifyPrevious()

Template.nav.helpers
    options: ->
        options =  {}
        debugger
        if @trip._id
            _.extend(options, {id: @trip._id})
        return options

    next: ->
        getNavigationForRoute(getCurrentRouteName()).next

    previous: ->
        getNavigationForRoute(getCurrentRouteName()).previous
