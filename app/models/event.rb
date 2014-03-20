class Event < ActiveRecord::Base
  attr_accessible :date, :budget, :description

  belongs_to :event_type
  belongs_to :customer, class_name: 'User'
  has_many :event_requests, dependent: :destroy

  scope :active, -> {where "date >= ? ", DateTime.now.beginning_of_day}
end
