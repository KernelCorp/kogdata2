class @WorkingCarousel
  constructor: (carousel, user_options) ->
    @moving = false
    @queue = 0
    @autoscroll = false

    @view = $ carousel

    @options = {
      autoSpeed: 0.05
    }

    $.merge @options, user_options if user_options


  scroll: ( direction = 1, speed = @options.autoSpeed, easing = 'linear' )->
    if @moving
      @queue += direction
      return

    sign = if direction < 0 then -1 else 1

    if Math.abs(direction) > 1
      @queue += direction - sign
      direction = sign

    @moving = true

    to_right = direction > 0

    horses = @view.children '.carousel_horse'
    first = horses.eq 0
    last = horses.eq -1

    if to_right
      removable_horse = first

      first.clone().insertAfter last

      @view.css left: 0
      left_target = -first.outerWidth()
    else
      removable_horse = last

      last.clone().insertBefore first

      @view.css left: -last.outerWidth()
      left_target = 0

    time = Math.abs( parseInt(@view.css('left')) - left_target ) / speed

    @view.animate { left: left_target }, time, easing, =>
      removable_horse.remove()
      @view.css left: 0
      @moving = false

      if @queue != 0
        remain = @queue
        @queue = 0 
        @scroll remain, speed, easing
      else if @autoscroll
        @scroll()

      return

    return

  startAutoScroll: ->
    return if @autoscroll
    @autoscroll = true
    @scroll()
    return

  stopAutoScroll: ->
    @autoscroll = false
    return

  clearQueue: ->
    @queue = 0
    return
