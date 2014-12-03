Template.radioButton.rendered = ->
  @input = @find('.RadioButton-input')

Template.radioButton.helpers
  active: ->
    'is-active' if @object.value == @form.get(@id)

Template.radioButton.events
  'tap .RadioButton-label': (e, template) ->
    e.preventDefault()
    id = template.data.id
    form = template.data.form
    value = template.data.object.value

    form.set(id, value)
