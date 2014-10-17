Template.layout.rendered = ->
  contentHeight = window.innerHeight - parseInt($('.u-makeHeader').css('height'))
  $('.u-makeContent').css('height', "#{contentHeight}px")

  Overscroll(document.querySelector('.Page'))
