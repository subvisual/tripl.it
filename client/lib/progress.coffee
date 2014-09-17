$.fn.progress = ->
  progress = $(this)
  percentage = Math.ceil($(this).attr('data-percentage'))
  $({countNum: 0}).animate {countNum: percentage},
    duration: 2000,
    easing: 'linear'
    step: ->
      pct = ''
      if (percentage == 0)
        pct = Math.floor(@countNum) '%'
      else
        pct = Math.floor(@countNum + 1) + '%'
      progress.css('width', pct)
