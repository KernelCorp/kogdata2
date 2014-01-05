json.array!(@events) do |event|
  json.extract! event, :id, :city, :date, :time, :event_type_id, :budget, :customer_id
  json.url event_url(event, format: :json)
end
