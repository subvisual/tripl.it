class Transition
  animations: ['none', 'slideLeft', 'slideRight']
  currentAnimation: 'slideLeft'

  initialize: (@el) ->
    @el._uihooks =
      insertElement: _.bind(@insertElement, this)
      removeElement: _.bind(@removeElement, this)

  animate: (animation) =>
    if _.indexOf(@animations, animation) != -1
      @currentAnimation = animation
    else
      @currentAnimation = 'none'

  insertElement: (node, next) ->
    if @currentAnimation in ['slideLeft', 'slideRight']
      Slide.insertElement(node, next, @currentAnimation)

  removeElement: (node) ->
    if @currentAnimation in ['slideLeft', 'slideRight']
      Slide.removeElement(node, @currentAnimation)

class Slide
  @ANIMATION_DURATION: 600
  @INSERT_START = { slideLeft: '100%', slideRight: '-100%' }
  @REMOVE_END = { slideLeft: '-100%', slideRight: '100%' }

  @insertElement: (node, next, animation) =>
    start = @INSERT_START[animation]
    $.Velocity.hook(node, 'translateX', start)
    $(node).insertBefore(next)
    $(node).velocity {translateX: [0, start]},
      duration: @ANIMATION_DURATION,
      easing: 'ease-in-out',
      queue: false

  @removeElement: (node, animation) =>
    end = @REMOVE_END[animation]
    $(node).velocity {translateX: end},
      duration: @ANIMATION_DURATION,
      easing: 'ease-in-out',
      queue: false,
      complete: () ->
        $(node).remove()

window.PageTransition = new Transition
