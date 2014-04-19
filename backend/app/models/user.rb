class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_token_authenticatable

  has_many :groups

  validates :username, presence: true, length: {minimum: 4}, uniqueness: {case_sensitive: false}
end
