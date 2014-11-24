Template.layout.helpers
  tripShow: ->
    Router.current().route.getName() == 'trips.show'

Template.layout.events
  'tap .IconAddExpense': ->
    id = Router.current().params._id
    if id
      Router.go 'expenses.new', { _id: id  }
  'tap .IconFriends': ->
    id = Router.current().params._id
    if id
      Router.go 'users.index', { _id: id }

Template.layout.rendered = ->
  if document.querySelector('.Page')
    Overscroll(document.querySelector('.Page'))
  Bender.initialize(@find('#content-container'))
