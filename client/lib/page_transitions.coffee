ANIMATIONS =
  none: 'none'
  slideLeft: 'slideLeft'
  slideRight: 'slideRight'
  overUp: 'overUp'
  overDown: 'overDown'

INSERT_START =
  slideLeft: '100%'
  slideRight: '-100%'

REMOVE_END =
  slideLeft: '-100%'
  slideRight: '100%'

class @PageDirection
  @_currentAnimation = ANIMATIONS.slideLeft

  @slideLeft: =>
    @_currentAnimation = ANIMATIONS.slideLeft

  @slideRight: =>
    @_currentAnimation = ANIMATIONS.slideRight

  @overUp: =>
    @_currentAnimation = ANIMATIONS.overUp

  @overDown: =>
    @_currentAnimation = ANIMATIONS.overDown

  @getInsertStart: =>
    INSERT_START[@_currentAnimation]

  @getRemoveEnd: =>
    REMOVE_END[@_currentAnimation]

class @PageTransition
  @ANIMATION_DURATION: 600

  constructor: (@el) ->
    @el._uihooks =
      insertElement: _.bind(@insertElement, this)
      removeElement: _.bind(@removeElement, this)

  insertElement: (node, next) =>
    start = PageDirection.getInsertStart()
    @_insertSlide(node, next, start)

  removeElement: (node) =>
    end = PageDirection.getRemoveEnd()
    @_removeSlide(node, end)

  _insertSlide: (node, next, start) ->
    $.Velocity.hook(node, 'translateX', start)
    $(node).insertBefore(next)
    $(node).velocity {translateX: [0, start]},
      duration: @ANIMATION_DURATION,
      easing: 'ease-in-out',
      queue: false

  _removeSlide: (node, end) ->
    $(node).velocity {translateX: end},
      duration: @ANIMATION_DURATION,
      easing: 'ease-in-out',
      queue: false,
      complete: () ->
        $(node).remove()
