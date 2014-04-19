require 'spec_helper'

describe Group do
  it { should have_many(:members) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }

  context 'uniqueness' do
    before(:each) do
      FactoryGirl.create(:group)
    end
    it { should validate_uniqueness_of(:name).scoped_to(:user_id).case_insensitive }
  end
end
