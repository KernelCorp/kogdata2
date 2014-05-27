class Kogdata2.Routers.EventsRouter extends Backbone.Router
  initialize: (options) ->
    @events = new Kogdata2.Collections.EventsCollection()
    window.eventRequestRouter = new Kogdata2.Routers.EventRequestsRouter({eventRequests: []});
    @events.reset options.events[0]
    @is_contractor = options.is_contractor
    $('.fc-button-prev').click =>
      if @is_contractor then @contractor_index() else @index()
      return
    $('.fc-button-next').click =>
      if @is_contractor then @contractor_index() else @index()
      return
  is_contractor: null

  routes:
    "events/new"      : "newEvent"
    ".*"              : "index"
    "events/:id/edit" : "edit"
    "events/:id"      : "show"
    "events/.*"       : "index"
    "calendar"        : "contractor_index"
    "calendar/:date"  : 'show_day_events'


  newEvent: ->
    @view = new Kogdata2.Views.Events.NewView collection: @events
    $("#events").html(@view.render().el)

  index: ->
    unless @is_contractor
      @events.fetch success: =>
        @view = new Kogdata2.Views.Events.IndexView collection: @events
        $('#events').html @view.render().el

  contractor_index: ->
    @events.fetch success: =>
      @view = new Kogdata2.Views.Events.ContractorView collection: @events
      @view.render_all()

  show: (id) ->
    new Kogdata2.Models.Event( id: id ).fetch success: (event) =>
      @view = new Kogdata2.Views.Events.ShowView model: event
      $('#events').html @view.render().el

  edit: (id) ->
    new Kogdata2.Models.Event( id: id ).fetch success: (event) =>
      @view = new Kogdata2.Views.Events.EditView model: event
      $('#events').html @view.render().el

  show_day_events: (date)->
    @view = new Kogdata2.Views.Events.ContractorView collection: @events
    @view.render_day(date)
    return

    
