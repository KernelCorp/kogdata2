require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :city => "",
      :date => "",
      :time => "",
      :event_type => nil,
      :budget => 1,
      :customer => nil
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_city[name=?]", "event[city]"
      assert_select "input#event_date[name=?]", "event[date]"
      assert_select "input#event_time[name=?]", "event[time]"
      assert_select "input#event_event_type[name=?]", "event[event_type]"
      assert_select "input#event_budget[name=?]", "event[budget]"
      assert_select "input#event_customer[name=?]", "event[customer]"
    end
  end
end
