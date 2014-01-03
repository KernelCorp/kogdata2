require 'spec_helper'

describe "conversations/index" do
  before(:each) do
    assign(:conversations, [
      stub_model(Conversation,
        :theme => "Theme"
      ),
      stub_model(Conversation,
        :theme => "Theme"
      )
    ])
  end

  it "renders a list of conversations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Theme".to_s, :count => 2
  end
end
