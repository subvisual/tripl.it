angular.module('triplit').service 'TripForm', (Trip) ->
  class TripForm
    @title: ''

    @submit: ->
      new Trip({name: @title}).$save()
      @title = ""

  return TripForm
