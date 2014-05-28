#= require './events_calendar_controller'
class @EventsCalendarController extends CalendarController

  update: (events)->
    for event in events
      date = new Date event.attributes.date
      day_selector = ".fc-day-number:contains('#{date.getDate()}')"
      $(day_selector).parent().addClass('event-day')
      $(day_selector).parent().append("<a class='event_link' href='#events/#{event.id}'></a>")
    return

  select_up_to_date_events: (events_collection) ->
    filtered_collection = []
    if window.calendarController
      for event in events_collection
        filtered_collection.push event if @is_up_to_date(event.attributes.date)
    return filtered_collection

  set_month: (month_num)->
    date = $(@calendar_selector).fullCalendar 'getDate'
    date.setMonth month_num
    $(@calendar_selector).fullCalendar 'gotoDate', date
    return
  set_year: (year_num)->
    date = $(@calendar_selector).fullCalendar 'getDate'
    date.setYear year_num
    $(@calendar_selector).fullCalendar 'gotoDate', date
    return

  month_and_year_for_url: ->
    date = $(@calendar_selector).fullCalendar 'getDate'
    return "/#{date.getMonth()}/#{date.getFullYear()}"
  is_up_to_date: (event_date)->
    event_date = new Date(event_date)
    return event_date.getMonth() == $(@calendar_selector).fullCalendar('getDate').getMonth()
