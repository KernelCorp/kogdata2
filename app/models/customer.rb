class Customer < User
  has_many :events

  def event_requests
    events.inject([]) {|requests, e| requests += e.event_requests}
  end
end