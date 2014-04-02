require 'spec_helper'

describe Event do
  it 'select active event' do
    active_event     = FactoryGirl.create :event, date: Date.today
    not_active_event = FactoryGirl.create :event, date: Date.yesterday
    active_events = Event.active.all
    active_events.should     include active_event
    active_events.should_not include not_active_event
  end

  describe "#on_day" do
    before :each do
      @event = FactoryGirl.create :event, date: DateTime.now
      @event_2 = FactoryGirl.create :event, date: (DateTime.now + 1)
    end

    it 'return [@event]' do
      expect(Event.on_day Date.today).to eq([@event])
    end

    it 'return empty array' do
      expect(Event.on_day(Date.yesterday).count).to eq(0)
    end

    it 'return all events if day is nil' do
      expect(Event.on_day nil).to eq([@event, @event_2])
    end
  end
end
