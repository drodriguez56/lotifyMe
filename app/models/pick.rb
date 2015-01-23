class Pick < ActiveRecord::Base
  validates :numbers, presence: true
  validates :game, presence: true
  validates :draw_date, presence: true
  validates_uniqueness_of :email, scope: [:number, :game, :draw_date]
  belongs_to :user
end
