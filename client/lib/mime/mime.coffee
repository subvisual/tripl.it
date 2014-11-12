class @Mime
  @currentAnimation: 'none'

  @initialize: (@el) ->
    @el._uihooks =
      insertElement: _.bind(@insertElement, this)
      removeElement: _.bind(@removeElement, this)

  @animate: (animation) =>
    @currentAnimation = animation

  @insertElement: (node, next) ->
    if @currentAnimation in SlideHorizontal.animations
      SlideHorizontal.insertElement(node, next, @currentAnimation)
    else if @currentAnimation in SlideVertical.animations
      SlideVertical.insertElement(node, next, @currentAnimation)
    else if @currentAnimation in None.animations
      None.insertElement(node, next)
    else
      throw new Error("#{@currentAnimation} animation doesn't exist!")

  @removeElement: (node) ->
    if @currentAnimation in SlideHorizontal.animations
      SlideHorizontal.removeElement(node, @currentAnimation)
    else if @currentAnimation in SlideVertical.animations
      SlideVertical.removeElement(node)
    else if @currentAnimation in None.animations
      None.removeElement(node)
    else
      throw new Error("#{@currentAnimation} animation doesn't exist!")

class None
  @animations = ['none']
  @insertElement: (node, next) =>
    $(node).insertBefore(next)
  @removeElement: (node) =>
    $(node).remove()

class SlideVertical
  @ANIMATION_DURATION: 600
  @INSERT_START = { slideUp: '100%', slideDown: '-100%' }

  @animations = ['slideUp', 'slideDown']

  @insertElement: (node, next, animation) =>
    start = @INSERT_START[animation]
    $(node).insertBefore(next)
    $(node).velocity { translateY: [0, start] },
      duration: @ANIMATION_DURATION,
      easing: 'ease-in-out',
      queue: false

  @removeElement: (node) =>
    # siteTimeout is a hack to only start the remove after the insert
    setTimeout =>
        $('.velocity-animating').promise().done =>
          $(node).remove()
      , @ANIMATION_DURATION

class SlideHorizontal
  @ANIMATION_DURATION: 600
  @INSERT_START = { slideLeft: '100%', slideRight: '-100%' }
  @REMOVE_END = { slideLeft: '-100%', slideRight: '100%' }

  @animations = ['slideLeft', 'slideRight']

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
