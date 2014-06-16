class Kogdata2.Models.EventRequest extends Backbone.Model
  paramRoot: 'event_request'
  urlRoot: '/event_requests'

  defaults:
    id: null
    photographer: null


class Kogdata2.Collections.EventRequestsCollection extends Backbone.Collection
  model: Kogdata2.Models.EventRequest
  url: '/event_requests'

  constructor: (event_id) ->
    if event_id == null
      @url = "/my_requests.json"
    else
      @url = "/events/#{event_id}/event_requests.json"
    super