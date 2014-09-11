@Users = new GroundDB 'users'

Users.allow
  insert: (userId, email) ->
    true
  update: () ->
    true
  remove: () ->
    true
