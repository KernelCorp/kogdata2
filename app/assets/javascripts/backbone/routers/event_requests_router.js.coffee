class Kogdata2.Routers.EventRequestsRouter extends Backbone.Router
  initialize: (options) ->
    @eventRequests = new Kogdata2.Collections.EventRequestsCollection()
    @eventRequests.reset options.eventRequests

  routes:
    "events/:event_id/requests/new"      : "newEventRequest"
    "events/:event_id/requests/index"    : "index"
    "events/:event_id/requests/:id/edit" : "edit"
    "events/:event_id/requests/:id"      : "show"
    "events/:event_id/requests"          : "index"
    "requsets"                           : "index"

  newEventRequest: ->
    @view = new Kogdata2.Views.EventRequests.NewView(collection: @eventRequest)
    $("#eventRequest").html(@view.render().el)

  index: (event_id) ->
    @eventRequests = new Kogdata2.Collections.EventRequestsCollection(event_id)
    @eventRequests.fetch();
    @view = new Kogdata2.Views.EventRequests.IndexView(eventRequests: @eventRequests)
    $("#events").html(@view.render().el)

  show: (id) ->
    event_request = @eventRequest.get(id)

    @view = new Kogdata2.Views.EventRequests.ShowView(model: event_request)
    $("#eventRequest").html(@view.render().el)

  edit: (id) ->
    event_request = @eventRequest.get(id)

    @view = new Kogdata2.Views.EventRequests.EditView(model: event_request)
    $("#eventRequest").html(@view.render().el)
