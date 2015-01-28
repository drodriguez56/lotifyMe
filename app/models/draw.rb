require 'net/http'

class Draw < ActiveRecord::Base
  validates :number, presence: true
  validates :game, presence: true
  validates :draw_date, presence: true
  validates_uniqueness_of :draw_date, scope: [:game]

  has_many :picks

  self.inheritance_column = :game

  scope :powerballs, -> { where(game: 'Powerball') }
  scope :mega_millions, -> { where(game: 'MegaMillion') }
  scope :nylottos, -> { where(game: 'NyLotto') }
  scope :cash4lifes, -> { where(game: 'Cash4Life') }
  scope :take5s, -> { where(game: 'Take5') }
  scope :pick10s, -> { where(game: 'Pick10') }

  def self.games
      %w(Powerball MegaMillions NyLotto Cash4Life Take5 Pick10)
  end
end


