Template.tripsNew.events
  'tap #navigation-next': ->
    submit()

  'tap #navigation-previous': ->
    IronBender.go 'trips.index', {}, { animation: 'slideRight' }

  'submit': (e) ->
    e.preventDefault()
    submit()

Template.tripsNew.helpers
  navigationAttributes: ->
    previous: 'IconBack'
    next: 'IconAdd'

submit = ->
  tripId = Random.id()
  name = $('#trip_name').val()
  Trips.insert
    _id: tripId
    name: name
    users: [{ email: Meteor.user().emails[0].address }]
  Router.go 'users.new', { _id: tripId }
