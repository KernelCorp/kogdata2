class Kogdata2.Models.Event extends Backbone.Model
  paramRoot: 'event'

  defaults:
    id: null
    date: null
    budget: null
    description: null

class Kogdata2.Collections.EventsCollection extends Backbone.Collection
  model: Kogdata2.Models.Event
  url: '/events'
