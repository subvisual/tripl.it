angular.module('triplit').directive 'navigation', ->
  return {
    restrict: 'EA'
    compile: (element, attributes) ->
      element.addClass('Navigation')
  }

angular.module('triplit').directive 'navigationBack', ->
  return {
    restrict: 'A'
    template: '<span class="IconBack"></span>'
  }

angular.module('triplit').directive 'navigationAdd', ->
  return {
    restrict: 'A'
    template: '<span class="IconAdd"></span>'
  }
