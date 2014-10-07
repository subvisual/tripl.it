Template.tripsShow.helpers
  actionAttributes: ->
    return {
      classes: "u-fixedBottom"
      icons: ["IconFriends", "IconAddExpense", "IconReport"]
    }

Template.tripsShow.events
  'click .IconAddExpense': ->
    Router.go 'expenseNew', {_id: Router.current().params._id}
