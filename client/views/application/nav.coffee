Template.nav.events
  'click #navigation-next': ->
    NavigationVent.notifyNext()

  'click #navigation-previous': ->
    NavigationVent.notifyPrevious()

Template.nav.helpers
  next: ->
    getNavigationForRoute().next

  previous: ->
    getNavigationForRoute().previous
