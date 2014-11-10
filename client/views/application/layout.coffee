Template.layout.rendered = ->
  setContentHeight()
  Overscroll(document.querySelector('.Page'))

setContentHeight = ->
  header = $('.u-makeHeader')
  actionBar = $('.ActionBar')

  contentHeight = window.innerHeight - parseInt(header.outerHeight())

  if actionBar.length
    contentHeight -= parseInt(actionBar.outerHeight())

  $('.u-makeContent').css('height', "#{contentHeight}px")
