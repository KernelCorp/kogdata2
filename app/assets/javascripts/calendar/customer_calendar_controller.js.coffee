#= require calendar/calendar_controller_base
class @CustomerCalendarController extends CalendarControllerBase

  constructor: ->
    @calendar_init()

  calendar_init: ->
    super
    events = @eventsController.index()
    for event in events
      date = new Date event.date
      day_selector = '.fc-date'+ date.getDate()
      $(day_selector).addClass('event-day')