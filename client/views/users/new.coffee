Template.usersNew.created = () ->
  NavigationVent.subscribeToPrevious(_.bind(Template.usersNew.cancel, this))
  NavigationVent.subscribeToNext(_.bind(Template.usersNew.submit, this))

Template.usersNew.submit = ->
  email = $('#user_email').val()
  Meteor.call('assignUserToTrip', email, getRouterParams()._id)
  Router.go 'budgetNew', { _id: getRouterParams()._id }

Template.usersNew.cancel = ->
  Router.go 'tripsAdd'

Template.usersNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.usersNew.submit()
