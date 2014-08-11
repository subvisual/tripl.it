app = angular.module 'triplit', ['ui.router', 'ngAnimate', 'pouchdb']

app.controller 'TripsController', ($scope, Trip) ->
  $scope.trips = Trip

app.controller 'NewTripController', ($scope, $state, Trip) ->
  $scope.trip = {}
  $scope.submit = ->
    Trip.post
      name: $scope.trip.name

app.controller 'ShowTripController', ($scope, $stateParams, Trip) ->
  $scope.startedDescription = 'Trip started'
  Trip.get $stateParams.id, (err, trip) ->
    $scope.trip = trip
    $scope.$apply()

app.controller 'NewExpenseController', ($scope, $rootScope, $stateParams, $state, Trip) ->
  Trip.get $stateParams.id, (err, trip) ->
    $rootScope.back()
    $scope.expense = {}
    $scope.submit = =>
      trip.expenses = [] if !trip.expenses
      trip.expenses.push $scope.expense
      Trip.put trip
      $state.go('trips.show')

app.run ($rootScope, $window) ->
  $rootScope.slide = ''
  $rootScope.$on '$stateChangeStart', () ->
    $rootScope.back = ->
      $rootScope.slide = 'slide-right'
    $rootScope.next = () ->
      $rootScope.slide = 'slide-left'
