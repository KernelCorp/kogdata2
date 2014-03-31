Kogdata2.Views.Conversations ||= {}

class Kogdata2.Views.Conversations.ShowView extends Backbone.View
  template: JST["backbone/templates/conversations/show"]

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
