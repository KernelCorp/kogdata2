Kogdata2.Views.EventRequests ||= {}

class Kogdata2.Views.EventRequests.ShowView extends Backbone.View
  template: JST["backbone/templates/eventRequest/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
