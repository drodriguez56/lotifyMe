class Pick < ActiveRecord::Base

	before_save { |pick| pick.normalize_game_names; pick.set_date_to_next_draw; pick.assign_draw_id }
  after_save { |pick| pick.setresult }

  validates :number, presence: true
  validates :game, presence: true
  validates :draw_date, presence: true
  validates_uniqueness_of :user, scope: [:number, :game, :draw_date]

  belongs_to :user
  belongs_to :draw

  def send_email
    if self.draw_date < Time.now
      Notifier.email_for_past_draw(self).deliver
    else
      Notifier.email_for_future_draw(self).deliver
    end
  end

  def normalize_game_names
    if self.game == 'Powerball'
      self.game = 'Powerball'
    elsif self.game == 'MegaMillions'
      self.game = 'MegaMillion'
    elsif self.game == 'NYLotto'
      self.game = 'NyLotto'
    elsif self.game == 'Cash4Life'
      self.game = 'Cash4Life'
    elsif self.game == 'Take5'
      self.game = 'Take5'
    elsif self.game == 'Pick10'
      self.game = 'Pick10'
    end
  end

	def set_date_to_next_draw
    if self.game == 'mega_millions' || self.game == 'powerball' || self.game == 'nylotto'
  		until [3, 6].include?(Date.parse(self.draw_date.to_s).cwday)
  			self.draw_date += 24 * 60 * 60
  		end
    end
    draw_date = Date.parse((self.draw_date.to_s)[0..9])
    self.draw_date = draw_date
	end

  def assign_draw_id
    draw = Draw.find_by(draw_date: self.draw_date)
    if draw
      self.draw_id = draw.id
    end
  end

  def setresult
    if self.result == nil && self.draw_id != nil
      update_pick(draw.find_score(self))
    end
  end

  def update_pick(result)
    self.update(result: result)
  end
end

