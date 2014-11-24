Template.usersNew.submit = ->
  email = $('#user_email').val()
  Meteor.call('assignUserToTrip', email, getRouterParams()._id)
  Router.go 'trips.budget', { _id: getRouterParams()._id }

Template.usersNew.helpers
  navigationAttributes: ->
    next: 'IconAdd'
    previous: 'IconBack'

Template.usersNew.events
  'tap #Navigation-next': (e) ->
    Template.usersNew.submit()

  'tap #Navigation-previous': (e) ->
    IronBender.go 'tripsAdd', {}, { animation: 'slideRight' }

Template.usersNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.usersNew.submit()
