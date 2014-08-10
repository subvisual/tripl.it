angular.module('triplit').directive "linked", () ->
  return {
    link: (scope, element, attrs) ->
      id = attrs["linked"]
      element.on "click", () ->
        document.getElementById(id).click()
  }
