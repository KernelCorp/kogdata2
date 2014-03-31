Kogdata2.Views.Conversations ||= {}

class Kogdata2.Views.Conversations.IndexView extends Backbone.View
  template: JST["backbone/templates/conversations/index"]

  initialize: () ->
    @options.conversations.bind('reset', @addAll)

  addAll: () =>
    @options.conversations.each(@addOne)

  addOne: (conversation) =>
    view = new Kogdata2.Views.Conversations.ConversationView({model : conversation})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(conversations: @options.conversations.toJSON() ))
    @addAll()

    return this
