json.extract! event_request,  :event_id, :photographer
json.set! :id, event_request.id.to_s
json.set! :photograph_path, user_path(event_request.photographer)
json.set! :photograph_id, event_request.photographer.id.to_s