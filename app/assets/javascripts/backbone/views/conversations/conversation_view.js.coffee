Kogdata2.Views.Conversations ||= {}

class Kogdata2.Views.Conversations.ConversationView extends Backbone.View
  template: JST["backbone/templates/conversations/conversation"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
