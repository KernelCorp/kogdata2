require 'spec_helper'

describe Skill do
  it 'name should be unique' do
    Skill.create! name: 'skill'
    expect {Skill.create! name: 'skill' }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
