tripId = null

Template.tripsAdd.created = () ->
    NavigationVent.subscribeToPrevious(_.bind(Template.tripsAdd.cancel, this))

Template.tripsAdd.cancel = ->
    if tripId
        Trips.remove tripId

Template.tripsAdd.events
    'keyup #trip_name': (e) ->
        name = $(e.target).val()
        if tripId
            Trips.update {_id: tripId}, {$set: {name: name}}
        else
            tripId = Trips.insert
                name: name
        
