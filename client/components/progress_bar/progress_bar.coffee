Template.progressBar.rendered = ->
  self = this
  self.autorun ->
    data = Template.currentData()
    $(self.find('.ProgressBar')).progress()
