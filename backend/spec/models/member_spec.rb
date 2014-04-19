require 'spec_helper'

describe Member do
  it { should belong_to(:group) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:group) }

  context 'uniquness' do
    before(:each) do
      FactoryGirl.create(:member)
    end
    it { should validate_uniqueness_of(:name).scoped_to(:group_id).case_insensitive }
  end
end
