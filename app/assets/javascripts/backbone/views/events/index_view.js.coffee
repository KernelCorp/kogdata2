Kogdata2.Views.Events ||= {}

class Kogdata2.Views.Events.IndexView extends Backbone.View
  template: JST["backbone/templates/events/index"]
  right_block: '#right_block'
  calendar: "<div class='back_white_box'><div class='calendar-container'><div id='calendar'></div></div></div>"
  initialize: () ->
#    @options.events.bind('reset', @addAll)

  render_calendar_widget: =>
    $(@right_block).html(@calendar)
    window.calendarController = new EventsCalendarController()
    $('.fc-button-prev').click =>
      window.eventsRouter.index()
      return
    $('.fc-button-next').click =>
      window.eventsRouter.index()
      return
    return


  addAll: () =>
#    @options.events.each(@addOne)
    if $('.calendar-container').length == 0
      @render_calendar_widget()
    filtered_collection = window.calendarController.select_up_to_date_events(@collection.models)
    for event in filtered_collection
      @addOne event
    window.calendarController.update filtered_collection


  addOne: (event) =>
    view = new Kogdata2.Views.Events.EventView({model : event})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(events: @collection.toJSON() ))
    @addAll()

    return this
