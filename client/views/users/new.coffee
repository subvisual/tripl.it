Template.usersNew.created = () ->
  NavigationVent.subscribeToPrevious(_.bind(Template.usersNew.cancel, this))
  NavigationVent.subscribeToNext(_.bind(Template.usersNew.submit, this))

Template.usersNew.submit = ->
  userId = Random.id()
  email = $('#user_email').val()
  Users.insert
    _id: userId
    email: email
  Trips.update { _id: getRouterParams()._id }, { $push: { usersId: userId } }
  Router.go 'budgetNew', { _id: getRouterParams()._id }

Template.usersNew.cancel = ->
  Router.go 'tripsAdd'

Template.usersNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.usersNew.submit()
