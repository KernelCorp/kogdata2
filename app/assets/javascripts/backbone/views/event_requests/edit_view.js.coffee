Kogdata2.Views.EventRequests ||= {}

class Kogdata2.Views.EventRequests.EditView extends Backbone.View
  template : JST["backbone/templates/eventRequest/edit"]

  events :
    "submit #edit-event_request" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (event_request) =>
        @model = event_request
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
