angular.module('triplit').service 'Expense', (DatabaseBase) ->
  class Expense
    angular.extend(this, DatabaseBase)
    angular.extend(this.prototype, DatabaseBase.prototype)

    @id = 1
    @list = []

    constructor: (options) ->
      angular.extend(this, options)
      Expense.save(this)
