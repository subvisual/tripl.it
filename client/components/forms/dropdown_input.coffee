Template.dropdownInput.rendered = ->
  @select = $(@$('select'))
  @selectedContainer = $(@$('.DropdownInput-selected'))

Template.dropdownInput.events
  'change select': (e, template) ->
    template.selectedContainer.text($(e.target).find(':selected').text())

  'click .DropdownInput-selected': (e, template) ->
    if Meteor.Device.isPhone()
      template.select.trigger('click')

  'click .DropdownInput-option': (e, template) ->
    id = $(e.target).data('value')

    template.select.val(id)
    template.select.change()
