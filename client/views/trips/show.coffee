Template.tripsShow.created = () ->
    NavigationVent.subscribeToNext(_.bind(Template.tripsShow.addExpense, this))

Template.tripsShow.addExpense = ->
    Router.go 'expenseNew', {_id: Router.current().params._id}

Template.tripsShow.findUserName = (id) ->
    return Meteor.users.findOne({ _id: id})
