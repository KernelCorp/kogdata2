require 'spec_helper'

describe "conversations/show" do
  before(:each) do
    @conversation = assign(:conversation, stub_model(Conversation,
      :theme => "Theme"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Theme/)
  end
end
