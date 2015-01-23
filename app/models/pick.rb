class Pick < ActiveRecord::Base

	before_save { |pick| pick.flush_date }

  validates :number, presence: true
  validates :game, presence: true
  validates :draw_date, presence: true
  validates_uniqueness_of :user, scope: [:number, :game, :draw_date]
  
  belongs_to :user

	def flush_date
		until [3, 6].include?(Date.parse(self.draw_date.to_s).cwday)
			self.draw_date += 24 * 60 * 60
		end
	end

end