class Kogdata2.Routers.ConversationsRouter extends Backbone.Router
  initialize: (options) ->
    @conversations = new Kogdata2.Collections.ConversationsCollection()
    @conversations.reset options.conversations

  routes:
    "conversations/new"      : "newConversation"
    "conversations/index"    : "index"
    "conversations/"         : "index"
    "conversations/:id"      : "show"

  newConversation: ->
    @view = new Kogdata2.Views.Conversations.NewView collection: @conversations
    $("#right_block").html(@view.render().el)

  index: ->
    @conversations.fetch reset: true, success: (collection)=>
      @view = new Kogdata2.Views.Conversations.IndexView collection: @conversations
      $("#right_block").html @view.render().el

  show: (id) ->
    new Kogdata2.Models.Conversation( id: id ).fetch success: (conversation)=>
      @view = new Kogdata2.Views.Conversations.ShowView model: conversation
      $('#right_block').html @view.render().el
