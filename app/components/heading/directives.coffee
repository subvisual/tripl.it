angular.module('triplit').directive 'headingAlpha', ->
  return {
    restrict: 'E'
    transclude: true
    replace: true
    templateUrl: 'components/heading/heading_alpha.html'
    scope:
      value: '@value'
  }
