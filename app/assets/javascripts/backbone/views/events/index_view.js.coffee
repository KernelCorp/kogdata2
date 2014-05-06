Kogdata2.Views.Events ||= {}

class Kogdata2.Views.Events.IndexView extends Backbone.View
  template: JST["backbone/templates/events/index"]

  initialize: () ->
    @options.events.bind('reset', @addAll)

  addAll: () =>
    @options.events.each(@addOne)
    window.calendarController.update @options.events.models if window.calendarController

  addOne: (event) =>
    view = new Kogdata2.Views.Events.EventView({model : event})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(events: @options.events.toJSON() ))
    @addAll()

    return this
