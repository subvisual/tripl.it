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
  Trip.get {id: $stateParams.id}, (trip) ->
    $scope.trip = trip

app.controller 'NewExpenseController', ($scope, $stateParams, Trip) ->
  $scope.expense = {}
  $scope.submit = =>
      debugger

app.run ($rootScope, $window) ->
  $rootScope.slide = ''
  $rootScope.$on '$stateChangeStart', () ->
    $rootScope.back = ->
      console.log 'back'
      $rootScope.slide = 'slide-right'
    $rootScope.next = () ->
      console.log 'next'
      $rootScope.slide = 'slide-left'

app.directive "linked", () ->
  return {
    link: (scope, element, attrs) ->
      id = attrs["linked"]
      element.on "click", () ->
        document.getElementById(id).click()
  }
