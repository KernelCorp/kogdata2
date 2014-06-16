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
    "requests/"                          : "index"
    "my_calendar/:month_num/:year_num"    : "contractor_index"

  newEventRequest: ->
    @view = new Kogdata2.Views.EventRequests.NewView(collection: @eventRequests)
    $("#eventRequest").html(@view.render().el)

  index: (event_id) ->
    @eventRequests = new Kogdata2.Collections.EventRequestsCollection(event_id)
    @eventRequests.fetch reset: true, success: (collection)=>
      @view = new Kogdata2.Views.EventRequests.IndexView(collection: @eventRequests)
      $("#events").html(@view.render().el)
      return

  contractor_index: (month_num, year_num)->
    @eventRequests = new Kogdata2.Collections.EventRequestsCollection(null)
    @eventRequests.fetch reset: true, success: (collection)=>
      get_event = (req)->
        return req.event
      events_collection = []
      events_collection = @eventRequests.map(get_event)
      @view = new Kogdata2.Views.Events.ContractorView(collection: events_collection)
      @view.render_all(month_num, year_num)
      console.log events_collection
      return

  show: (id) ->
    event_request = @eventRequest.get(id)

    @view = new Kogdata2.Views.EventRequests.ShowView(model: event_request)
    $("#eventRequest").html(@view.render().el)

  edit: (id) ->
    event_request = @eventRequest.get(id)

    @view = new Kogdata2.Views.EventRequests.EditView(model: event_request)
    $("#eventRequest").html(@view.render().el)
