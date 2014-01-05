class Event < ActiveRecord::Base
  attr_accessible :date, :time, :budget

  belongs_to :event_type
  belongs_to :customer, class_name: 'User'

  scope :active, -> {where "date >= ? ", DateTime.now.beginning_of_day}
end
