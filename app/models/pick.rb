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

  def find_winner
    picks = Pick.all
    draws = Draw.all
    picks.each do |pick|
      pickarr = pick.number.split(' ')
      power_pick = pickarr.pop
      if draw = draws.find_by(draw_date: pick.draw_date)
        drawarr = draw.number.split(' ')
        power_draw = drawarr.pop
        match = pickarr & drawarr
        if power_pick == power_draw
          result = match.length.to_s + 'P'
        else
          result = match.length
        end
        pick.update(result: result)
      end
    end
  end
end

