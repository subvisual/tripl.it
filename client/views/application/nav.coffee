Template.nav.events
  'tap #navigation-next': ->
    NavigationVent.notifyNext()

  'tap #navigation-previous': ->
    NavigationVent.notifyPrevious()

Template.nav.helpers
  next: ->
    getNavigationForRoute().next

  previous: ->
    getNavigationForRoute().previous
