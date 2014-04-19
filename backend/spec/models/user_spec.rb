require 'spec_helper'

describe User do
  it { should have_many(:groups) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should ensure_length_of(:username).is_at_least(4) }

  context 'uniqueness' do
    before(:each) do
      FactoryGirl.create(:user)
    end
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email) }
  end
end
