ANIMATION_DURATION = 600

nextInitiator = null
initiator = null
Deps.autorun  ->
  Router.current()
  
  initiator = nextInitiator
  nextInitiator = null

Template.layout.helpers
  tripShow: ->
    Router.current().route.getName() == 'trips.show'

Template.layout.events
  'click .IconAddExpense': ->
    id = Router.current().params._id
    if id
      Router.go 'expenses.new', { _id: id  }
  'click .IconFriends': ->
    id = Router.current().params._id
    if id
      Router.go 'users.index', { _id: id }

Template.layout.rendered = ->
  Overscroll(document.querySelector('.Page'))

  @find('#content-container')._uihooks = {
    insertElement: insertElement
    ,
    removeElement: removeElement
  }

insertElement = (node, next) ->
  if (initiator == 'menu')
    return $(node).insertBefore(next)
  
  #start = (initiator == 'back') ? '-100%' : '100%'
  start = '100%'
  
  $.Velocity.hook(node, 'translateX', start)
  $(node).insertBefore(next)
  $(node).velocity {translateX: [0, start]},
    duration: ANIMATION_DURATION,
    easing: 'ease-in-out',
    queue: false

removeElement = (node) ->
  if (initiator == 'menu')
    return $(node).remove()
  
  #end = (initiator == 'back') ? '100%' : '-100%'
  end = '-100%'
  
  $(node)
    .velocity({translateX: end}, {
      duration: ANIMATION_DURATION,
      easing: 'ease-in-out',
      queue: false,
      complete: () ->
        $(node).remove()
    })
