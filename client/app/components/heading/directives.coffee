angular.module('triplit').directive 'tripHeading', ->
  return {
    restrict: 'E'
    transclude: true
    templateUrl: 'components/heading/trip_heading.html'
    scope:
      value: '@value'
  }
