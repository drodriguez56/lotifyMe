class Pick < ActiveRecord::Base

	before_save { |pick| pick.set_date_to_next_draw; pick.assign_draw_id }
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

	def set_date_to_next_draw
    update_draw_date(draw.set_date(self))
  end

  def assign_draw_id
    draws = Draw.where(game: self.game)
    draw = draws.find_by(draw_date: self.draw_date)
    if draw
      self.draw_id = draw.id
    end
  end

  def setresult
    if self.result == nil && self.draw_id != nil
      update_pick(draw.find_score(self))
    end
  end

  def update_result(result)
    self.update(result: result)
  end

  def update_draw_date(draw_date)
    self.update(draw_date: draw_date)
  end
end

