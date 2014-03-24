Kogdata2.Views.EventRequests ||= {}

class Kogdata2.Views.EventRequests.IndexView extends Backbone.View
  template: JST["backbone/templates/event_requests/index"]

  initialize: () ->
    @options.eventRequests.bind('reset', @addAll)

  addAll: () =>
    @options.eventRequests.each(@addOne)

  addOne: (eventRequest) =>
    view = new Kogdata2.Views.EventRequests.EventRequestView({model : eventRequest})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(eventRequests: @options.eventRequests.toJSON() ))
    @addAll()

    return this
