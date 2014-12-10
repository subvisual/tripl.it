Template.boxTrip.events
  'click': (e, template) ->
    Session.set('currentTrip', template.data._id)
