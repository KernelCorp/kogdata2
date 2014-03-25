json.extract! event, :city, :date, :event_type, :budget
json.set! :id, event.id.to_s
json.set! :event_requests_count, event.event_requests.count