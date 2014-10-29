Template.radioButton.rendered = ->
  @input = @find('.RadioButton-input')

Template.radioButton.events
  'tap .RadioButton-label': (e, template) ->
    e.preventDefault()
    template.input.checked = true
