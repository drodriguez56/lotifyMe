class User < ActiveRecord::Base
	validates :username, uniqueness: true
	validates_format_of :username, :with => /\A[A-Za-z\d_]+\z/,
		message: "can only contain alpha-numeric characters and underscores with no spaces.",
		allow_blank: true

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/,
  	message: "is not in a valid format"
  
  validates :phone, uniqueness: true
  validates_format_of :phone, with: /\A(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?\z/,
  	message: "is not a valid phone number",
  	allow_blank: true

  validates :password, length: { within: 6..20 },
  	allow_blank: true	
  
  has_many :picks
  has_secure_password
end
