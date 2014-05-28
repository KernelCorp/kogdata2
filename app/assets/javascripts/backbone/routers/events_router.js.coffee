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
    "calendar/:month_num/:year_num"        : "contractor_index"
    "calendar"        : "contractor_index"
    "calendar/day/:date"  : 'show_day_events'
    "calendar/:month_num/:year_num/day/:date"  : 'show_day_events'


  newEvent: ->
    @view = new Kogdata2.Views.Events.NewView collection: @events
    $("#events").html(@view.render().el)

  index: ->
    unless @is_contractor
      @events.fetch success: =>
        @view = new Kogdata2.Views.Events.IndexView collection: @events
        $('#events').html @view.render().el

  contractor_index: (month_num, year_num)->
    @events.fetch success: =>
      @view = new Kogdata2.Views.Events.ContractorView collection: @events
      @view.render_all(month_num, year_num)

  show: (id) ->
    new Kogdata2.Models.Event( id: id ).fetch success: (event) =>
      @view = new Kogdata2.Views.Events.ShowView model: event
      $('#events').html @view.render().el

  edit: (id) ->
    new Kogdata2.Models.Event( id: id ).fetch success: (event) =>
      @view = new Kogdata2.Views.Events.EditView model: event
      $('#events').html @view.render().el

  show_day_events: (mont_num, year_num, date)->
    @events.fetch success:  =>
      @view = new Kogdata2.Views.Events.ContractorView collection: @events
      @view.render_day(date)
    return

    
