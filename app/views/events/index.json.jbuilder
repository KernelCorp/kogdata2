json.array!(@events) do |event|
  json.partial! 'events/event', event: event
  json.url event_url(event, format: :json)
end
