json.array!(@events) do |event|
  json.partial! 'events/event', event: event
  json.set! :event_requests_count, event.event_requests.count
  json.url event_url(event, format: :json)
end
