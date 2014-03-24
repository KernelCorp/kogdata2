Kogdata2.Views.EventRequests ||= {}

class Kogdata2.Views.EventRequests.NewView extends Backbone.View
  template: JST["backbone/templates/eventRequest/new"]

  events:
    "submit #new-event_request": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (event_request) =>
        @model = event_request
        window.location.hash = "/#{@model.id}"

      error: (event_request, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
