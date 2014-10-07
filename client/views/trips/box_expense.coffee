Template.boxExpense.events
  'tap .Box-options': (e) ->
    e.preventDefault()
    e.stopPropagation()
    Meteor.call('removeExpense', @id)

Template.boxExpense.helpers
  arguments: ->
    return {
      extra: @value
      icon: "Icon#{camelize(@category.value)}"
      description: "#{@user} payed #{@category.description}"
    }
