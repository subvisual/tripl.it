Template.tripBox.events
    'dragleft': (e) ->
        $(e.target).parent().find('.Box-options').animate({right: 0})

    'dragright': (e) ->
        elem = $(e.target).parent().find('.Box-options')
        elem.animate({right: "-#{elem.width()}px"})

    'tap .Box-options': (e) ->
        e.preventDefault()
        e.stopPropagation()

        Trips.remove(@_id)
    'tap .Box-description': ->
        Router.go('tripsShow', this)
