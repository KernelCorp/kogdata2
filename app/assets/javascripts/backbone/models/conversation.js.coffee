class Kogdata2.Models.Conversation extends Backbone.Model
  paramRoot: 'conversation'

  defaults:
    theme: null

class Kogdata2.Collections.ConversationsCollection extends Backbone.Collection
  model: Kogdata2.Models.Conversation
  url: '/conversations'
