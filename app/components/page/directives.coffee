angular.module('triplit').directive 'page', ->
  return {
    restrict: 'A'
    compile: (element, attributes) ->
      element.addClass('Page')
  }
