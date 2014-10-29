Template.tripHeader.helpers
  percentage: ->
    total = parseInt @total
    current = parseInt @current
    current / total * 100
