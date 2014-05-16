Kogdata2.Views.Events ||= {}

class Kogdata2.Views.Events.IndexView extends Backbone.View
  template: JST["backbone/templates/events/index"]

  initialize: () ->
#    @options.events.bind('reset', @addAll)

  addAll: () =>
#    @options.events.each(@addOne)
    if window.calendarController
      filtered_collection = window.calendarController.select_up_to_date_events(@options.events.models)
      for event in filtered_collection
        @addOne event
      window.calendarController.update filtered_collection

  addOne: (event) =>
    view = new Kogdata2.Views.Events.EventView({model : event})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(events: @options.events.toJSON() ))
    @addAll()

    return this
