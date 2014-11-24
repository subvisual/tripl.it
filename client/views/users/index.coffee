Template.usersIndex.events
  'tap #navigation-previous': (e, template) ->
    IronBender.go 'trips.show', { _id: template.data.trip._id }, { animation: 'slideRight' }

  'tap #navigation-next': (e, template) ->
    IronBender.go 'users.new', { _id: template.data.trip._id }, { animation: 'slideLeft' }

Template.usersIndex.helpers
  navigationAttributes: ->
    next: 'IconAdd'
    previous: 'IconBack'
