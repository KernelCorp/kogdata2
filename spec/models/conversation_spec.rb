require 'spec_helper'

describe Conversation do
  it 'find owner' do
    user = FactoryGirl.create :user
    conversation = FactoryGirl.create :conversation, owner: user
    conversation.owner.should eq(user)
  end
end
