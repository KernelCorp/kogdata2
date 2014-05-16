class @EventsCalendarController extends CalendarController

  update: (events) ->
    for event in events
      date = new Date event.attributes.date
      day_selector = ".fc-day-number:contains('#{date.getDate()}')"
      $(day_selector).parent().addClass('event-day')
    return

  select_up_to_date_events: (events_collection) ->
    filtered_collection = []
    if window.calendarController
      for event in events_collection
        filtered_collection.push event if @is_up_to_date(event.attributes.date)
    return filtered_collection


  is_up_to_date: (event_date)->
    event_date = new Date(event_date)
    console.log event_date.getMonth() == $(@calendar_selector).fullCalendar('getDate').getMonth()
    return event_date.getMonth() == $(@calendar_selector).fullCalendar('getDate').getMonth()
