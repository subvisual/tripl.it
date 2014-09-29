Template.signIn.helpers
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

Template.signIn.submit = ->
  email = $('#email').val()
  password = $('#password').val()
  Meteor.loginWithPassword(email, password, (err) ->
    if err
      console.log(err)
    else
      Template.signIn.pushNotificationRegister()
      Router.go 'tripsIndex'
  )

Template.signIn.pushNotificationRegister = ->
  try
    pushNotification = window.plugins.pushNotification
    if device.platform is "android" or device.platform is "Android" or device.platform is "amazon-fireos"
      pushNotification.register successHandler, errorHandler,
        senderID: "664229378667"
        ecb: "onNotification"

successHandler = (result) ->
  console.log "success:" + result

errorHandler = (error) ->
  console.log "error:" + error

Template.signIn.events
  'submit': (e) ->
    e.preventDefault()
    Template.signIn.submit()
