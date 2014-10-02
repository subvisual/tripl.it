Template.boxExpense.events
  'tap .Box-options': (e) ->
    e.preventDefault()
    e.stopPropagation()
    Meteor.call('removeExpense', @id)
