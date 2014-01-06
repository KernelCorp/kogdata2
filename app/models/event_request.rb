class EventRequest < ActiveRecord::Base
  attr_accessible :photographer
  belongs_to :event
  belongs_to :photographer, class_name: 'User'
  validates_uniqueness_of :event_id, scope: [:photographer_id]
end
