class Kogdata2.Models.Message extends Backbone.Model
  paramRoot: 'message'

  schema: { text: 'Text' }

class Kogdata2.Collections.MessagesCollection extends Backbone.Collection
  model: Kogdata2.Models.Message

  initialize: ( models = [], options = {} )->
    super
    @url = "/conversations/#{options.conversation_id}/messages"
