class Kogdata2.Models.Conversation extends Backbone.Model
  paramRoot: 'conversation'
  urlRoot: '/conversations'

  defaults:
    id: null
    theme: null
    #messages: []

  parse: (response)->
    response.messages = new Kogdata2.Collections.MessagesCollection( response.messages, conversation_id: response.id )
    response

  toJSON: ->
    json = super
    json.messages = json.messages.toJSON()
    json

class Kogdata2.Collections.ConversationsCollection extends Backbone.Collection
  model: Kogdata2.Models.Conversation
  url: '/conversations'
