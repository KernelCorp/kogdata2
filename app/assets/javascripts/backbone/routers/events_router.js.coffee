class Kogdata2.Routers.EventsRouter extends Backbone.Router
  initialize: (options) ->
    @events = new Kogdata2.Collections.EventsCollection()
    @events.reset options.events

  routes:
    "events/new"      : "newEvent"
    ".*"              : "index"
    "events/:id/edit" : "edit"
    "events/:id"      : "show"
    "events/.*"       : "index"

  newEvent: ->
    @view = new Kogdata2.Views.Events.NewView(collection: @events)
    $("#events").html(@view.render().el)

  index: ->
    @view = new Kogdata2.Views.Events.IndexView(events: @events)
    $("#events").html(@view.render().el)

  show: (id) ->
    event = @events.get(id)

    @view = new Kogdata2.Views.Events.ShowView(model: event)
    $("#events").html(@view.render().el)

  edit: (id) ->
    event = @events.get(id)

    @view = new Kogdata2.Views.Events.EditView(model: event)
    $("#events").html(@view.render().el)
