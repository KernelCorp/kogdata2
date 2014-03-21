json.extract! event, :id, :city, :date, :time, :event_type_id, :budget, :customer_id, :created_at, :updated_at
json.event_type { json.name (event.event_type.nil? ? nil : event.event_type.name) }
json.set! :event_requests_count, event.event_requests.count