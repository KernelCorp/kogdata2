require 'spec_helper'

describe "conversations/new" do
  before(:each) do
    assign(:conversation, stub_model(Conversation,
      :theme => "MyString"
    ).as_new_record)
  end

  it "renders new conversation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", conversations_path, "post" do
      assert_select "input#conversation_theme[name=?]", "conversation[theme]"
    end
  end
end
