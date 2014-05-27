class @ContractorCalendarController extends EventsCalendarController

  update: (events)->
    for event in events
      date = new Date event.attributes.date
      day_selector = ".fc-day-number:contains('#{date.getDate()}')"
      $(day_selector).parent().addClass('event-day')
      $(day_selector).parent().append("<a class='event_link' href='#{window.location}/#{event.attributes.date}'></a>")
    return
