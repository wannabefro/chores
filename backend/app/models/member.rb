class Member < ActiveRecord::Base
  belongs_to :group
  
  validates :name, presence: true, uniqueness: {scope: :group_id, case_sensitive: false}
  validates :group, presence: true
end
