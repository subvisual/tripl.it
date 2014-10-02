Template.headingAlpha.helpers
  percentage: ->
    total = parseInt @total
    current = parseInt @current
    current / total * 100
