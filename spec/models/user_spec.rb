require 'spec_helper'

describe User do
  it 'should use mass assigns' do
    user = User.create! name: 'name', email: 'ex@example.com', password: 'password'
    user.name.should eq('name')
  end

  it 'user should be owner conversation if created' do
    user = FactoryGirl.create :user
    conv = user.conversations.create! theme: 'new'
    conv.owner.should eq(user)
  end
end
