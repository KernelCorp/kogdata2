json.extract! @event, :id, :city, :date, :time, :event_type_id, :budget, :customer_id, :created_at, :updated_at
json.set! :event_type, (@event.event_type.nil? ? nil : @event.event_type.name)