json.extract! event_request,  :event_id
json.set! :id, 1
json.photographer { json.name (event_request.photographer.nil? ? 'Django Freeman' : event_request.photographer.name) }