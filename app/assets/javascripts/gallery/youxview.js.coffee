@yoxview_call = ( yox_container )->
  $ yox_container
  .yoxview({
    backgroundOpacity: 0.5
    renderInfoExternally: false
    renderInfoPin: false
    renderButtons: false
    renderMenu: false
    renderInfo: false
    autoHideInfo: false
    popupMargin: '0 80'
    onClose: -> $('#yoxviewButtons').fadeOut()
    onOpen: -> $('#yoxviewButtons').fadeIn()
  })

$ ->
  $('#yoxviewButtons').clicked (e)->
    switch e.target.className
      when 'leftButton'  then $.yoxview.prev()
      when 'rightButton' then $.yoxview.next()
      else
        $.yoxview.close() 
        $(this).fadeOut()
    return
