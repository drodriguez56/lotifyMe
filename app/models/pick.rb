class Pick < ActiveRecord::Base

	before_save { |pick| pick.set_date_to_next_draw; pick.assign_draw_id }
  after_save { |pick| pick.setresult }

  validates :number, presence: true
  validates :game, presence: true
  validates :draw_date, presence: true
  validates_uniqueness_of :user, scope: [:number, :game, :draw_date]

  belongs_to :user
  belongs_to :draw

	def set_date_to_next_draw
    if self.game == 'mega_millions' || self.game == 'powerball' || self.game == 'nylotto'
  		until [3, 6].include?(Date.parse(self.draw_date.to_s).cwday)
  			self.draw_date += 24 * 60 * 60
  		end
    end
    draw_date = Date.parse((self.draw_date.to_s)[0..9])
    self.draw_date = draw_date
	end

  def gametype
  #these are simple match type games (take5 and pick10)
    if self.game == 1
      p '1'
  #these are matching type games with a bonus ball ('mega_millions' || 'powerball' || 'nylotto' || 'cash4life')
    elsif self.game == 2
      p '2'
  #these are sum type games ('numbers' || 'win4')
    else
      p '3'
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

