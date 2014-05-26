Kogdata2.Views.EventRequests ||= {}

class Kogdata2.Views.EventRequests.EventRequestView extends Backbone.View
  template: JST["backbone/templates/event_requests/event_request"]

  events:
    "click .destroy" : "destroy"


  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
