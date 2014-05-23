class Kogdata2.Routers.EventsRouter extends Backbone.Router
  initialize: (options) ->
    @events = new Kogdata2.Collections.EventsCollection()
    window.eventRequestRouter = new Kogdata2.Routers.EventRequestsRouter({eventRequests: []});
    @events.reset options.events[0]
    $('.fc-button-prev').click =>
      @index()
      return
    $('.fc-button-next').click =>
      @index()
      return
  routes:
    "events/new"      : "newEvent"
    ".*"              : "index"
    "events/:id/edit" : "edit"
    "events/:id"      : "show"
    "events/.*"       : "index"


  newEvent: ->
    @view = new Kogdata2.Views.Events.NewView collection: @events
    $("#events").html(@view.render().el)

  index: ->
    @events.fetch success: =>
      @view = new Kogdata2.Views.Events.IndexView collection: @events
      $('#events').html @view.render().el

  show: (id) ->
    new Kogdata2.Models.Event( id: id ).fetch success: (event) =>
      @view = new Kogdata2.Views.Events.ShowView model: event
      $('#events').html @view.render().el

  edit: (id) ->
    new Kogdata2.Models.Event( id: id ).fetch success: (event) =>
      @view = new Kogdata2.Views.Events.EditView model: event
      $('#events').html @view.render().el

    
