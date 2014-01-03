require 'spec_helper'

describe "conversations/edit" do
  before(:each) do
    @conversation = assign(:conversation, stub_model(Conversation,
      :theme => "MyString"
    ))
  end

  it "renders the edit conversation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", conversation_path(@conversation), "post" do
      assert_select "input#conversation_theme[name=?]", "conversation[theme]"
    end
  end
end
