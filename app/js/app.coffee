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

app.controller 'NewExpenseController', ($scope, $stateParams, Trip) ->
  Trip.get $stateParams.id, (err, trip) ->
    $scope.expense = {}
    $scope.submit = =>
      trip.expenses = [] if !trip.expenses
      trip.expenses.push $scope.expense
      Trip.put trip

app.run ($rootScope, $window) ->
  $rootScope.slide = ''
  $rootScope.$on '$stateChangeStart', () ->
    $rootScope.back = ->
      $rootScope.slide = 'slide-right'
    $rootScope.next = () ->
      $rootScope.slide = 'slide-left'
