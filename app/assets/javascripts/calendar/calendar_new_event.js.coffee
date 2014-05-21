class @CalendarNewEventController extends CalendarController

  month_input: '#event_month'
  day_input: '#event_day'

  constructor: ->
    $(@month_input).change @form_month_change
    $(@day_input).on 'input', @form_day_change
    super
    return

  form_change_date: ()=>
    curr_date = $(@calendar_selector).fullCalendar 'getDate'
    curr_date.setMonth parseInt($(@month_input).val())+1
    curr_date.setDate 0
    if $(@day_input).val()> curr_date.getDate()
      $(@day_input).val(curr_date.getDate())
#    if $(@day_input).val() == ''
#      $(@day_input).val(1)
    new_month = $(@month_input).val()
    new_day = $(@day_input).val()
    curr_date = $(@calendar_selector).fullCalendar 'getDate'
    curr_date.setDate(new_day)
    curr_date.setMonth(new_month)
    curr_date.setDate(new_day)
    curr_month = (parseInt(curr_date.getMonth())+1) + ''
    curr_day = curr_date.getDate()
    if curr_month.length == 1
      curr_month = "0#{curr_month}"
    curr_day = curr_date.getDate()+''
    if curr_day.length == 1
      curr_day = "0#{curr_day}"
    data_date = "#{curr_date.getFullYear()}-#{curr_month}-#{curr_day}"
    $('.current_date').removeClass('current_date')
    $(@calendar_selector).fullCalendar 'gotoDate', curr_date
    $("td[data-date=#{data_date}]").addClass('current_date')
    return

  form_month_change: =>
    @form_change_date()
    console.log 'form month change!!!'
    return
  form_day_change: =>
    @form_change_date()
    console.log 'form day change!!!'
    return

  calendar_month_change: =>
    console.log 'calendar month change!!!'
    return
  calendar_day_change: =>
    console.log 'calendar day change!!!'
    return