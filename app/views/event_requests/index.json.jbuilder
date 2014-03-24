json.array!(@event_requests) do |event_request|
  json.partial! 'event_requests/event_request', event_request: event_request
end
