require 'spec_helper'

describe EventType do
  it 'name is unique' do
    EventType.create! name: 'type1'
    expect { EventType.create! name: 'type1' }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
