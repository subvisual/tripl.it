Template.dropdown.rendered = ->
  @dropdownPopup = $(@$('.Dropdown-popup'))

Template.dropdown.helpers
  selected: ->
    @form.get(@id)

Template.dropdown.events
  'tap .Dropdown-popup': (e, template) ->
    template.dropdownPopup.removeClass('is-open')

  'tap .Dropdown-selected': (e, template) ->
    template.dropdownPopup.addClass('is-open')
    e.stopPropagation()

Template.dropdownItem.helpers
  selected: ->
    'is-selected' if @form.get(@id) == @object

Template.dropdownItem.events
  'tap': (e, template) ->
    form = template.data.form
    id = template.data.id
    object = template.data.object
    form.set(id, object)
