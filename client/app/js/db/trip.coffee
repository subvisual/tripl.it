angular.module('triplit').service 'TripForm', (Trip) ->
  class TripForm
    @title: ''

    @submit: ->
      new Trip({name: @title})
      @title = ""

  return TripForm

#angular.module('triplit').service 'Trip', (DatabaseBase, Expense) ->
  #class Trip
    #angular.extend(this, DatabaseBase)
    #angular.extend(this.prototype, DatabaseBase.prototype)

    #@id = 1
    #@list = []

    #constructor: (options) ->
      #@expenses = []
      #angular.extend(this, options)
      #Trip.save(this)

    #createExpense: (options) ->
      #angular.extend(options, {id: @id})
      #newExpense = new Expense(options)
      #@expenses.push newExpense
      #return newExpense

  #trip = new Trip({name: "Codebits"})
  #trip.createExpense({description: 'Sleep'})
  #trip.createExpense({description: 'Home'})
  #new Trip({name: "LXJS"}).createExpense({description: 'Gas'})
  
  #return Trip
 
#angular.module('triplit').service 'Trip', (Database, Expense) ->
  #Database.transaction (tx) ->
    #tx.executeSql 'CREATE TABLE IF NOT EXISTS trips (
      #id integer primary key autoincrement,
      #name text)', []
    #tx.executeSql "INSERT INTO trips (text) VALUES ('Funciona')"

  #class Trip
    #@all: (cb) ->
      #Database.transaction (tx) ->
        #tx.executeSql 'SELECT * FROM trips', [], (tx, trips) ->
          #cb(trips)

    #constructor: (options) ->
      #angular.extend(this, options)

    #save: ->
      #Database.transaction (tx) =>
        #tx.executeSql "INSERT INTO trips (text) VALUES ('#{@name}')"
      ##if (@P_ID)
        ##Table.add(_.pick(this, 'name'))
      ##else
        ##Table.add(_.pick(this, 'name', 'P_ID'))
      ##return this

    ##createExpense: (options) ->
      ##angular.extend(options, {id: @id})
      ##newExpense = new Expense(options)
      ##@expenses.push newExpense
      ##return newExpense
 
  ##new Trip({name: 'Random'}).save()

  #return Trip
