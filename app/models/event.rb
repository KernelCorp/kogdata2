class Event
  include Mongoid::Document
  field :date,   type: DateTime
  field :budget, type: Integer, default: 0
  field :city,   type: String
  field :description
  field :event_type, type: String

  scope :active, -> { where :date.gte => DateTime.now.beginning_of_day }

  belongs_to :customer
  has_many :event_requests

end