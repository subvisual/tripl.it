app = angular.module 'triplit', ['ui.router', 'ngAnimate', 'lbServices']

app.controller 'TripsController', ($scope, Trip) ->
  Trip.query (trips) ->
    $scope.trips = trips

app.controller 'NewTripController', ($scope, $state, TripForm) ->
  $scope.trip = TripForm

  $scope.cancel = ->
    $state.transitionTo 'trips'

  $scope.submit = ->
    TripForm.submit()
    $state.transitionTo 'trips'

app.controller 'ShowTripController', ($scope, $stateParams, Trip) ->
  $scope.startedDescription = 'Trip started'
  Trip.get {id: $stateParams.id}, (trip) ->
    $scope.trip = trip

app.run ($rootScope, $window) ->
  $rootScope.slide = ''
  $rootScope.$on '$stateChangeStart', () ->
    $rootScope.back = ->
      $rootScope.slide = 'slide-right'
    $rootScope.next = () ->
      $rootScope.slide = 'slide-left'
