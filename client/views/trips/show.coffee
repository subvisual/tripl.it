Template.tripsShow.events
  'tap #navigation-previous': ->
    IronBender.go('trips.index', {}, { animation: 'slideRight' })

  'tap .IconAddExpense': ->
    IronBender.go 'expenses.new', { _id: Router.current().params._id }, { animation: 'slideOverUp' }
  'tap .IconFriends': ->
    IronBender.go 'users.index', { _id: Router.current().params._id }, { animation: 'slideLeft' }

  'swipeleft': (ev) ->
    ev.gesture.preventDefault()
    IronBender.go('trips.index', {}, { animation: 'slideRight' })

Template.tripsShow.helpers
  navigationAttributes: ->
    previous: 'IconBack'
