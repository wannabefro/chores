class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members

  validates :name, presence: true, uniqueness: {scope: :user_id, case_sensitive: false}
  validates :user, presence: true

  accepts_nested_attributes_for :members
end
