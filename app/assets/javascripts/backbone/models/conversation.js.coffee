class Kogdata2.Models.Conversation extends Backbone.Model
  paramRoot: 'conversation'

  defaults:
    id: null
    theme: null
    messages: []

  fetchMessages: () ->
    url = "/conversations/#{@id}/messages.json"
    results = $.ajax(
      url,
      dataType: 'json'
      type:     'GET'
      async:    false,
    ).responseText;
    @set { messages: new $.parseJSON(results) }


class Kogdata2.Collections.ConversationsCollection extends Backbone.Collection
  model: Kogdata2.Models.Conversation
  url: '/conversations'
