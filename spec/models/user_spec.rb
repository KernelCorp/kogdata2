require 'spec_helper'

describe User do
  it 'should use mass assigns' do
    user = User.create! name: 'name', email: 'ex@example.com', password: 'password'
    user.name.should eq('name')
  end

  it 'login as id if not specified' do
    user = User.create! name: 'name', email: 'ex@example.com', password: 'password'
    expect( user.login ).to eq user.id.to_s
  end

  it 'login specified' do
    user = User.create! name: 'name', email: 'ex@example.com', password: 'password', login: 'login'
    expect( user.login ).to eq 'login'
  end

end
