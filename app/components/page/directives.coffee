angular.module('triplit').directive 'page', ->
  return {
    restrict: 'EA'
    compile: (element, attributes) ->
      element.addClass('Page')
  }

angular.module('triplit').directive 'pageWithHeader', ->
  return {
    restrict: 'EA'
    compile: (element, attributes) ->
      element.addClass('Page Page--withHeader')
  }
