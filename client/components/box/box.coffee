Template.box.rendered = ->
  new Snap
    element: @find('.Box-menu')
    tapToClose: false
    maxPosition: 0
    minPosition: -100
    disable: 'left'
    resistance: 0.8
    transitionSpeed: 0.5
