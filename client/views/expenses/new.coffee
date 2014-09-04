expenseId = null

Template.expenseNew.created = () ->
    NavigationVent.subscribeToPrevious(_.bind(Template.expenseNew.cancel, this))
    NavigationVent.subscribeToNext(_.bind(Template.expenseNew.submit, this))

Template.expenseNew.submit = ->
    Router.go 'tripsShow', {_id: getRouterParams()._id}

Template.expenseNew.cancel = ->
    if expenseId
        Expenses.remove expenseId
    Router.go 'tripsShow', {_id: getRouterParams()._id}

Template.expenseNew.events
    'keyup #expense_description': (e) ->
        description = $(e.target).val()
        if expenseId
            Expenses.update {_id: expenseId}, {$set: {description: description}}
        else
            expenseId = Expenses.insert
                description: description
                tripId: getRouterParams()._id
       
    'submit': (e) ->
        e.preventDefault()
        Router.go 'tripsShow', {_id: getRouterParams()._id}
