class Email < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/,
    message: "is not in a valid format"


end