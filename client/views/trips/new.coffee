Template.tripsAdd.created = () ->
  NavigationVent.subscribeToPrevious(_.bind(Template.tripsAdd.cancel, this))
  NavigationVent.subscribeToNext(_.bind(Template.tripsAdd.submit, this))

Template.tripsAdd.cancel = ->
  Router.go 'tripsIndex'

Template.tripsAdd.submit = ->
  tripId = Random.id()
  name = $('#trip_name').val()
  Meteor.call('createTrip', name, tripId)
  Router.go 'usersNew', { _id: tripId }

Template.tripsAdd.events
  'submit': (e) ->
    e.preventDefault()
    Template.tripsAdd.submit()
