Template.tripsAdd.created = () ->
  NavigationVent.subscribeToPrevious(_.bind(Template.tripsAdd.cancel, this))
  NavigationVent.subscribeToNext(_.bind(Template.tripsAdd.submit, this))

Template.tripsAdd.cancel = ->
  Router.go 'tripsIndex'

Template.tripsAdd.submit = ->
  name = $('#trip_name').val()
  Trips.insert
    name: name
  Router.go('tripsIndex')

Template.tripsAdd.events
  'submit': (e) ->
    e.preventDefault()
    Template.tripsAdd.submit()
