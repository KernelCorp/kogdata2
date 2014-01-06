require 'spec_helper'

describe "event_requests/show" do
  before(:each) do
    @event_request = assign(:event_request, stub_model(EventRequest,
      :event => nil,
      :photographer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
