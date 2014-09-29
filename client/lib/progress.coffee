$.fn.progress = ->
  progress = $(this)
  percentage = Math.ceil($(this).attr('data-percentage'))
  progress.css('width', '0')
  progress.animate
    width: percentage + '%'
    backgroundColor: 'red'
    ,
    1000
