json.extract! event_request, :id, :event_id, :photographer
json.set! :photograph_path, user_path(event_request.photographer)
json.set! :photograph_id, event_request.photographer.id.to_s
