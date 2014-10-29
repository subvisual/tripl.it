Template.tripsNew.created = () ->
  NavigationVent.subscribeToNext(_.bind(Template.tripsNew.submit, this))

Template.tripsNew.submit = ->
  tripId = Random.id()
  name = $('#trip_name').val()
  Trips.insert
    _id: tripId
    name: name
    users: [{ email: Meteor.user().emails[0].address }]
  Router.go 'usersNew', { _id: tripId }

Template.tripsNew.events
  'submit': (e) ->
    e.preventDefault()
    Template.tripsAdd.submit()
