Template.dropdownInput.rendered = ->
  @select = $(@$('select'))
  @selectedContainer = $(@$('.DropdownInput-selected'))

Template.dropdownInput.events
  'click .DropdownInput-option': (e, template) ->
    id = $(e.target).data('value')
    text = $(e.target).text()

    template.select.val(id)
    template.selectedContainer.data('value', id)
    template.selectedContainer.text(text)

