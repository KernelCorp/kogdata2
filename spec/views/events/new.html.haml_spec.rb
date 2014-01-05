require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :city => "",
      :date => "",
      :time => "",
      :event_type => nil,
      :budget => 1,
      :customer => nil
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_city[name=?]", "event[city]"
      assert_select "input#event_date[name=?]", "event[date]"
      assert_select "input#event_time[name=?]", "event[time]"
      assert_select "input#event_event_type[name=?]", "event[event_type]"
      assert_select "input#event_budget[name=?]", "event[budget]"
      assert_select "input#event_customer[name=?]", "event[customer]"
    end
  end
end
