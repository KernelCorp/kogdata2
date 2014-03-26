require 'spec_helper'

describe Customer do
  describe '#event_requests' do
    it "return requests for all user's events" do
      event_1 = FactoryGirl.create :event, event_requests: [FactoryGirl.build(:event_request),
                                                            FactoryGirl.build(:event_request)]
      customer = event_1.customer
      event_2 = FactoryGirl.create :event, customer: customer,
                                           event_requests: [FactoryGirl.build(:event_request),
                                                            FactoryGirl.build(:event_request)]
      expected = event_1.event_requests + event_2.event_requests
      expect(customer.event_requests).to eq(expected)
    end
  end
end