require 'spec_helper'

describe Photographer do
  it 'add skills to photographer' do
    photographer = FactoryGirl.create :photographer
    skill = FactoryGirl.create :skill
    photographer.skills << skill
    photographer.save!
    photographer.reload.skills.should include(skill)
  end
end