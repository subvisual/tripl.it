Template.usersIndex.created = ->
  Navigation.onNext(_.bind(Template.usersIndex.add, this))

Template.usersIndex.add = ->
  Router.go('users.new', { _id: @data.trip._id })
