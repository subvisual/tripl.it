Template.userDropdown.created = ->
  @data.form.set(@data.id, @data.list[0])

Template.userDropdown.helpers
  usersAttributes: ->
    form: @form
    id: @id
    itemTemplate: 'userItem'
    label: 'Who payed for this?'
    list: @list
    selectedTemplate: 'userSelected'
