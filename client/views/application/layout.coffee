Template.layout.rendered = ->
  contentHeight = window.innerHeight - parseInt($('.Navigation').css('height'))
  $('.Page').css('height', contentHeight)

  Overscroll(document.querySelector('.Page'))
