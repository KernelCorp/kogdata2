class Kogdata2.Models.EventRequest extends Backbone.Model
  paramRoot: 'event_request'

  defaults:
    id: null
    photographer: null


class Kogdata2.Collections.EventRequestsCollection extends Backbone.Collection
  model: Kogdata2.Models.EventRequest
  url: ''

  constructor: (event_id) ->
    if event_id == null
      @url = "event_requests.json"
    else
      @url = "/events/#{event_id}/event_requests.json"
    super