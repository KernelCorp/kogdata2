json.extract! event, :id, :city, :date, :event_type, :budget
json.set! :event_requests_count, event.event_requests.count
