require 'spec_helper'

describe User do
  it 'should use mass assigns' do
    user = User.create! name: 'name', email: 'ex@example.com', password: 'password'
    user.name.should eq('name')
  end
end
