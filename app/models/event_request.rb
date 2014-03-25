class EventRequest
  include Mongoid::Document
  belongs_to :event
  belongs_to :photographer
  validates_uniqueness_of :event_id, scope: [:photographer_id]
end
