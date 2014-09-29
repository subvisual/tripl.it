@camelize = (s) ->
    s.replace /(\w)(\w*)/g, (g0,g1,g2) ->
      return g1.toUpperCase() + g2.toLowerCase()
