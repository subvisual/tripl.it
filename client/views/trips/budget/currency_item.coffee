Template.userItem.helpers
  selected: ->
    'is-selected' if @parent.form.get(@parent.id) == @object

Template.userItem.events
  'tap': (e, template) ->
    form = template.data.parent.form
    id = template.data.parent.id
    object = template.data.object
    form.set(id, object)
