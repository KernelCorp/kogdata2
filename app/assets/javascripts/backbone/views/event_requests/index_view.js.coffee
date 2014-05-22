Kogdata2.Views.EventRequests ||= {}

class Kogdata2.Views.EventRequests.IndexView extends Backbone.View
  template: JST["backbone/templates/event_requests/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (eventRequest) =>
    view = new Kogdata2.Views.EventRequests.EventRequestView({model : eventRequest})
    @$("tbody").append(view.render().el)

  render: =>
    $(".gallery").remove() if  $(".gallery")
    $(@el).html(@template(eventRequests: @collection.toJSON() ))
    @addAll()

    return this
