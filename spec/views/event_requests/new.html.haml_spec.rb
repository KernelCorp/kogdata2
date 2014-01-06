require 'spec_helper'

describe "event_requests/new" do
  before(:each) do
    assign(:event_request, stub_model(EventRequest,
      :event => nil,
      :photographer => nil
    ).as_new_record)
  end

  it "renders new event_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_requests_path, "post" do
      assert_select "input#event_request_event[name=?]", "event_request[event]"
      assert_select "input#event_request_photographer[name=?]", "event_request[photographer]"
    end
  end
end
