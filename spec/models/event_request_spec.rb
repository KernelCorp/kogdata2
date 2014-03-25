require 'spec_helper'

describe EventRequest do
  it 'only one request for an event' do
    customer     = FactoryGirl.create :customer
    photographer = FactoryGirl.create :photographer
    event = FactoryGirl.create :event, customer: customer
    photographer.event_requests.create! event: event
    expect {photographer.event_requests.create! event: event}.to raise_error(Mongoid::Errors::Validations)
  end
end
