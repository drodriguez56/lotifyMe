class Draw < ActiveRecord::Base
  validates :number, presence: true
  validates :game, presence: true
  validates :draw_date, presence: true
end
