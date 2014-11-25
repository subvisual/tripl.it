Template.currencyItem.helpers
  selected: ->
    'is-selected' if @parent.form.get(@parent.id) == @object

Template.currencyItem.events
  'tap': (e, template) ->
    form = template.data.parent.form
    id = template.data.parent.id
    object = template.data.object
    form.set(id, object)
