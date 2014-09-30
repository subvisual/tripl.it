Template.layoutWithHeader.rendered = ->
  contentHeight = window.innerHeight - parseInt($('.Navigation').css('height'))
  $('.Page').css('height', "#{contentHeight}px")

  Overscroll(document.querySelector('.Page'))
