require 'spec_helper'

describe Event do
  it 'select active event' do
    active_event     = FactoryGirl.create :event, date: Date.today
    not_active_event = FactoryGirl.create :event, date: Date.yesterday
    active_events = Event.active.all
    active_events.should     include active_event
    active_events.should_not include not_active_event
  end
end
