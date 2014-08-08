angular.module('triplit').service 'Trip', (pouchdb) ->
  return pouchdb.create('trips')
