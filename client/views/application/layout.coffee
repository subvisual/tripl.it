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
  PageTransition.initialize(@find('#content-container'))
