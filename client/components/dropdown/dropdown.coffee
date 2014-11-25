# The dropdown receives the following arguments
#
#             form: a ReactiveForm
#               id: the id to use in the ReactiveForm
#     itemtemplate: a string with the name of the template of the dropdown list
#            label: a label to use in the popup header
#             list: a list of things to select from
# selectedtemplate: a string with the name of the template to use to show the current selected item

Template.dropdown.rendered = ->
  @dropdownPopup = $(@$('.Dropdown-popup'))

Template.dropdown.helpers
  selectedTemplate: ->
    Template[@selectedTemplate]
  itemTemplate: ->
    Template[@parent.itemTemplate]
  selected: ->
    @form.get(@id)

Template.dropdown.events
  'tap .Dropdown-popup': (e, template) ->
    template.dropdownPopup.removeClass('is-open')

  'tap .Dropdown-selected': (e, template) ->
    template.dropdownPopup.addClass('is-open')
    e.stopPropagation()
