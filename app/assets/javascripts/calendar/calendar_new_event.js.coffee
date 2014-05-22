class @CalendarNewEventController extends CalendarController

  month_input: '#event_month'
  day_input: '#event_day'
  year_input: '#event_year'
  calendar_nav: '.fc-button-prev, .fc-button-next'
  calendar_day: '.fc-day'


  constructor: ->
    super
    $(@month_input).change @form_change_date
    $(@day_input).on 'input', @form_change_date
    $(@year_input).change @form_change_year
    $(@calendar_nav).click @calendar_month_change
    $(@calendar_day).click @calendar_day_change
    @initialize_date()

    return

  initialize_date: ()->
    curr_date = $(@calendar_selector).fullCalendar 'getDate'
    $(@day_input).val(curr_date.getDate())
    $(@month_input).val(curr_date.getMonth())
    $(@year_input).val(curr_date.getFullYear())
    @mark_current_date(curr_date)
    return


  form_change_date: ()=>
    curr_date = @inspect_day()
    $(@calendar_selector).fullCalendar 'gotoDate', curr_date
    @mark_current_date(curr_date)
    $(@calendar_day).click @calendar_day_change
    return


  inspect_day: ->
    curr_date = $(@calendar_selector).fullCalendar 'getDate'
    curr_date.setYear($(@year_input).val())
    curr_date.setMonth parseInt($(@month_input).val())+1
    curr_date.setDate 0
    if $(@day_input).val()> curr_date.getDate()
      $(@day_input).val(curr_date.getDate())
    new_month = $(@month_input).val()
    new_day = if $(@day_input).val()=='' then '1' else  $(@day_input).val()
    new_year = $(@year_input).val()
    curr_date = $(@calendar_selector).fullCalendar 'getDate'
    curr_date.setYear(new_year)
    curr_date.setDate(new_day)
    curr_date.setMonth(new_month)
    curr_date.setDate(new_day)
    return curr_date

  mark_current_date: (curr_date)=>
    curr_month = (parseInt(curr_date.getMonth())+1) + ''
    curr_day = curr_date.getDate()
    if curr_month.length == 1
      curr_month = "0#{curr_month}"
    curr_day = curr_date.getDate()+''
    if curr_day.length == 1
      curr_day = "0#{curr_day}"
    data_date = "#{curr_date.getFullYear()}-#{curr_month}-#{curr_day}"
    $('.current_date').removeClass('current_date')
    $("td[data-date=#{data_date}]").addClass('current_date')
    return

  form_change_year: =>
    curr_date = @inspect_day()
    $(@calendar_selector).fullCalendar 'gotoDate', curr_date
    $(@calendar_day).click @calendar_day_change
    @mark_current_date(curr_date)
    return



  calendar_month_change: =>
    curr_date = $(@calendar_selector).fullCalendar 'getDate'
    $(@month_input).val(curr_date.getMonth())
    $(@year_input).val(curr_date.getFullYear())
    @mark_current_date(@inspect_day())
    $(@calendar_selector).fullCalendar 'setDate', curr_date
    $(@calendar_day).click @calendar_day_change
    return


  calendar_day_change: (param)=>
    day = param.currentTarget
    unless $(day).hasClass('fc-other-month')
      $('.current_date').removeClass('current_date')
      $(day).addClass('current_date')
      curr_date = new Date $(day).data('date')
      $(@day_input).val(curr_date.getDate())
    return