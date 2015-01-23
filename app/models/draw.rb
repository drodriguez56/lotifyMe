class Draw < ActiveRecord::Base
  validates :numbers, presence: true
  validates :game, presence: true
  validates :draw_date, presence: true
end
