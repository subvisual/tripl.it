emailAttributes: ->
  {
    id: 'email',
    type: 'email',
    name: 'email',
    placeholder: 'Type your email here...',
    class: 'TextInput'
  }

passwordAttributes: ->
  {
    id: 'password',
    type: 'password',
    name: 'password',
    placeholder: 'Type your password here...',
    class: 'TextInput'
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
