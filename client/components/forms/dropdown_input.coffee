Template.dropdownInput.rendered = ->
  @select = $(@$('select'))
  @selectedContainer = $(@$('.DropdownInput-selected'))

Template.dropdownInput.events
  'change select': (e, template) ->
    template.selectedContainer.text($(e.target).find(':selected').text())

  'tap .DropdownInput-selected': (e, template) ->
    if Meteor.Device.isPhone()
      template.select.trigger('click')

  'tap .DropdownInput-option': (e, template) ->
    id = $(e.target).data('value')

    template.select.val(id)
    template.select.change()
