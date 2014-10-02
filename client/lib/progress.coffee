$.fn.progress = ->
  progress = $(this)
  percentage = Math.ceil($(this).attr('data-percentage'))
  progress.animate
    width: percentage + '%'
    backgroundColor: 'red'
    ,
    1000
