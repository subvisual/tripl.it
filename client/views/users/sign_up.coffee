Template.signUp.helpers
  emailAttributes: ->
    {
      type: "email"
      name: "email"
      placeholder: "Type your email here..."
    }

  passwordAttributes: ->
    {
      type: 'password'
      name: 'password'
      placeholder: 'Type your password here...'
    }

Template.signUp.submit = () ->
  email = $('#email').val()
  password = $('#password').val()
  Accounts.createUser({ email: email, password: password }, (err) ->
    if err
      console.log(err)
    else
      Router.go 'tripsIndex'
  )

Template.signUp.events
  'submit': (e) ->
    e.preventDefault()
    Template.signUp.submit()
