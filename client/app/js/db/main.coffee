angular.module('triplit').service 'Database', ($window) ->
  return $window.openDatabase('triplit', '1.0', 'tripl.it database', 2 * 1024 * 1024)

angular.module('triplit').factory 'DatabaseBase', ->
  class DatabaseBase
    @all: (cb) ->
      cb(@list)

    @each: (cb) ->
      cb item for item in @list

    @get: (id, cb) ->
      cb _.findWhere(@list, {id: parseInt(id)})

    @save: (item) ->
      angular.extend(item, {id: @id++})
      @list.push item
      return item

    set: (options) ->
      angular.extend(this, options)
      return this

  return DatabaseBase
