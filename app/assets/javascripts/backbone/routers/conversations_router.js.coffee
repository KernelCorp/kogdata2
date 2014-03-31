class Kogdata2.Routers.ConversationsRouter extends Backbone.Router
  initialize: (options) ->
    @conversations = new Kogdata2.Collections.ConversationsCollection()
    @conversations.reset options.conversations

  routes:
    "conversations/new"      : "newConversation"
    "conversations/index"    : "index"
    "conversations/"          : "index"

  newConversation: ->
    @view = new Kogdata2.Views.Conversations.NewView(collection: @conversations)
    $("#right_block").html(@view.render().el)

  index: ->
    @conversations.reset().fetch()
    @view = new Kogdata2.Views.Conversations.IndexView(conversations: @conversations)
    $("#right_block").html(@view.render().el)
