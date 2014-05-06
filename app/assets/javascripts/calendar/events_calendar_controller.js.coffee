class @EventsCalendarController extends CalendarController

  update: (events) ->
    for event in events
      date = new Date event.attributes.date
      day_selector = ".fc-day-number:contains('#{date.getDate()}')"
      $(day_selector).parent().addClass('event-day')
