@doc = $ document

@jso = ( data )-> JSON.stringify data

@log = ( data )-> console.log data

@random = ( max )-> return Math.floor Math.random() * max

jQuery.fn.extend
  clicked: ()->
    args = arguments
    return this.on(
      'mousedown'
      if args.length == 2 then args[0] else null
      (e)->
        return if e.which && e.which != 1
        return args[args.length-1].apply this, arguments
    )

  choosen: ( className )->
    this.addClass( className ).siblings().removeClass( className )
    return this

  ajax: ( type, url, data, reaction )->
    return this if this.hasClass('ajax_waiting') || this.hasClass('ajax_disabled')

    this.addClass 'ajax_waiting'

    element = this

    if url_is_data = url.match /^d:(.+)$/
      url = this.data url_is_data[1]

    return $.ajax
      type: if type == 'get' then 'GET' else 'POST'
      url: url
      data: $.extend data, { _method: type }
      complete: ()->
        element.removeClass 'ajax_waiting'
      success: ( response )->
        reaction response if reaction
