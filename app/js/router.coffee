angular.module('triplit').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/trips'

  $stateProvider
  .state 'trips',
    url: '/trips'
    abstract: true
    templateUrl: 'partials/layout.html'

  .state 'trips.index',
    url: ''
    views:
      'content@trips':
        templateUrl: 'partials/trips/index.html'
      'nav@trips':
        templateUrl: 'partials/trips/index_nav.html'
        #controller: ($scope, $state, $rootScope) ->
          #$scope.next = () ->
            #$rootScope.next()
            #$state.go('trips.new')

  .state 'trips.new',
    url: '/new'
    views:
      'content@trips':
        templateUrl: 'partials/new_trip/new.html'
      'nav@trips':
        templateUrl: 'partials/new_trip/new_nav.html'

  .state 'trips.show',
    url: '/:id'
    views:
      'content@trips':
        templateUrl: 'partials/show_trip/show.html'
      'nav@trips':
        templateUrl: 'partials/show_trip/show_nav.html'

  .state 'trips.show.expenses',
    url: '/expenses'

  .state 'trips.show.expenses.new',
    url: '/new'
    views:
      'content@trips':
        templateUrl: 'partials/new_expense/new_expense.html'
      'nav@trips':
        templateUrl: 'partials/new_expense/new_expense_nav.html'
