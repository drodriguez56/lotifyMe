class User < ActiveRecord::Base
  validates :email, presence: true
  has_many :picks
  has_secure_password
end
