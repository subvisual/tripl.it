Template.dropdown.rendered = ->
  @dropdownList = $(@$('.Dropdown-dropdown'))
  $('html').on 'tap', =>
    @dropdownList.removeClass('is-open')

Template.dropdown.helpers
  selected: ->
    @form.get(@id)

Template.dropdown.events
  'tap .Dropdown-selected': (e, template) ->
    template.dropdownList.toggleClass('is-open')
    e.stopPropagation()

  'tap .Dropdown-option': (e, template) ->
    form = template.data.form
    id = template.data.id
    form.set(id, this)
