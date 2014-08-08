app = angular.module 'triplit', ['ui.router', 'ngAnimate', 'lbServices']

app.controller 'TripsController', ($scope, Trip) ->
  Trip.query (trips) ->
    $scope.trips = trips

app.controller 'NewTripController', ($scope, $state, TripForm) ->
  $scope.trip = TripForm
  $scope.submit = ->
    debugger
    TripForm.submit()

app.controller 'ShowTripController', ($scope, $stateParams, Trip) ->
  $scope.startedDescription = 'Trip started'
  Trip.get {id: $stateParams.id}, (trip) ->
    $scope.trip = trip

app.controller 'NewExpenseController', ($scope, $stateParams, Trip) ->
  Trip.get {id: $stateParams.id}, (trip) ->
    debugger
  $scope.expense = {}
  $scope.submit = =>
    Trip({id: $stateParams.id}).expenses.create({description: $scope.expense.description, value: 0, trip_id: $stateParams.id})

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
