angular.module('triplit').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
  .state 'trips',
    url: '/'
    views:
      'content':
        templateUrl: 'partials/trips/index.html'
      'nav':
        templateUrl: 'partials/trips/index_nav.html'

  .state 'newTrip',
    url: '/trips/new'
    views:
      'content':
        templateUrl: 'partials/trips/new.html'
      'nav':
        templateUrl: 'partials/trips/new_nav.html'

  .state 'showTrip',
    url: '/trips/:id'
    views:
      'content':
        templateUrl: 'partials/show_trip/show.html'
      'nav':
        templateUrl: 'partials/show_trip/show_nav.html'
