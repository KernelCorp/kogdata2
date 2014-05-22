Kogdata2.Views.Conversations ||= {}

class Kogdata2.Views.Conversations.IndexView extends Backbone.View
  template: JST["backbone/templates/conversations/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (conversation) =>
    view = new Kogdata2.Views.Conversations.ConversationView( model: conversation )
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(conversations: @collection.toJSON() ))
    @addAll()

    return this
