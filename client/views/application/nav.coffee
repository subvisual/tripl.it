Template.nav.events
  'tap #navigation-next': ->
    Navigation.notifyNext()

  'tap #navigation-previous': ->
    Navigation.notifyPrevious()

Template.nav.helpers
  next: ->
    getNavigationForRoute().next

  previous: ->
    getNavigationForRoute().previous
