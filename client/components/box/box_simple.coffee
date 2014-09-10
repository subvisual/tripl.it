Template.boxSimple.events
    'dragleft': (e) ->
        $(e.target).parent().find('.Box-options').animate({right: 0})

    'dragright': (e) ->
        elem = $(e.target).parent().find('.Box-options')
        elem.animate({right: "-#{elem.width()}px"})
