Template.signUp.submit = () ->
  email = $('#email').val()
  password = $('#password').val()
  Accounts.createUser(
    { email: email, password: password },
    (err) ->
      if err
        console.log(err)
      else
        Router.go 'tripsIndex'
  )

Template.signUp.cancel = () ->

Template.signUp.events
  'submit': (e) ->
    e.preventDefault()
    Template.signUp.submit()
