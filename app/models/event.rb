class Event < ActiveRecord::Base
  attr_accessible :date, :budget, :description

  scope :active, -> {where "date >= ? ", DateTime.now.beginning_of_day }

  belongs_to :event_type
  belongs_to :customer, class_name: 'User'
  has_many :event_requests, dependent: :destroy

  accepts_nested_attributes_for :event_type
  accepts_nested_attributes_for :event_requests
end