Template.tripsShow.created = () ->
  Navigation.onPrevious ->
    IronBender.go('trips.index', {}, { animation: 'slideRight' })

Template.tripsShow.events
  'click .IconAddExpense': ->
    IronBender.go 'expenses.new', { _id: Router.current().params._id }, { animation: 'slideOverUp' }
  'click .IconFriends': ->
    IronBender.go 'users.index', { _id: Router.current().params._id }, { animation: 'slideLeft' }
