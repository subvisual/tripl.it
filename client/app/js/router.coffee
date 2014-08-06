angular.module('triplit').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/trips'

  $stateProvider
  .state 'trips',
    url: '/trips'
    abstract: true
    templateUrl: 'partials/trips/layout.html'

  .state 'trips.index',
    url: ''
    views:
      'content@trips':
        templateUrl: 'partials/trips/index.html'
      'nav':
        templateUrl: 'partials/trips/index_nav.html'

  .state 'trips.new',
    url: '/new'
    views:
      'content@trips':
        templateUrl: 'partials/trips/new.html'
      'nav':
        templateUrl: 'partials/trips/new_nav.html'

  .state 'trips.show',
    url: '/:id'
    views:
      'content@trips':
        templateUrl: 'partials/show_trip/show.html'
      'nav':
        templateUrl: 'partials/show_trip/show_nav.html'

  .state 'trips.show.newExpenses',
    url: '/expenses/new'
    views:
      'content@trips':
        templateUrl: 'partials/new_expense/new_expense.html'
      'nav@trips':
        templateUrl: 'partials/new_expense/new_expense_nav.html'
