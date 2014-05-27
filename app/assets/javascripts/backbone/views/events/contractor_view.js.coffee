Kogdata2.Views.Events ||= {}

class Kogdata2.Views.Events.ContractorView extends Backbone.View
  template: JST["backbone/templates/events/index_in_day"]
  right_block: '#right_block'
  calendar: "<div class='back_white_box'><div class='calendar-container'><div id='calendar'></div></div></div>"
  initialize: () ->
#    @options.events.bind('reset', @addAll)

  render_calendar_widget: =>
    $(@right_block).html(@calendar)
    window.calendarController = new ContractorCalendarController()
    $('.fc-button-prev').click =>
      window.eventsRouter.contractor_index()
      return
    $('.fc-button-next').click =>
      window.eventsRouter.contractor_index()
      return
    return


  addAll: () =>
#    @options.events.each(@addOne)
    if $('.calendar-container').length == 0
      @render_calendar_widget()
    filtered_collection = window.calendarController.select_up_to_date_events(@collection.models)
    window.calendarController.update filtered_collection


  addOne: (event) =>
    view = new Kogdata2.Views.Events.EventView({model : event})
    @$("tbody").append(view.render().el)

  render_all: =>
    @addAll()

  render_day: (date)=>
    date = new Date(date)
    filtered_collection = []
    for event in @collection.models
      event_date = new Date(event.attributes.date)
      filtered_collection.push event if event_date.getDate() == date.getDate() && event_date.getMonth() == date.getMonth() && event_date.getFullYear() == date.getFullYear()
    $('body').append(@template(events: filtered_collection))
    return

    return this
