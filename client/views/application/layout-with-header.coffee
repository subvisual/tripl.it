Template.layoutWithHeader.rendered = ->
  contentHeight = window.innerHeight - parseInt($('.u-makeHeader').css('height'))
  $('.u-makeContentWithHeader').css('height', "#{contentHeight}px")

  Overscroll(document.querySelector('.Page'))
