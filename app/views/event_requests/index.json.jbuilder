json.array!(@event_requests) do |event_request|
  json.extract! event_request, :id, :event_id, :photographer_id
  json.url event_request_url(event_request, format: :json)
end
