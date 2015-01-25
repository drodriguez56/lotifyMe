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

  def assign_draw_id
    draw = Draw.find_by(draw_date: self.draw_date)
    if draw
      self.draw_id = draw.id
    end
  end

  def setresult
    if self.result == nil && self.draw_id != nil
      if self.game == 'powerball'
        self.powerball(self.getscore)
      elsif self.game == 'mega_millions'
        self.mega_millions(self.getscore)
      elsif self.game == 'nylotto'
        self.nylotto(self.getscore)
      elsif self.game == 'cash4life'
        self.cash4life(self.getscore)
      elsif self.game == 'take5'
        self.take5(self.getscore)
      elsif self.game == 'pick10'
        self.pick10(self.getscore)
      end
    end
  end

  def getscore
  #these are simple match type games (take5 || nylotto || pick10)
    if self.game == 'take5' || self.game == 'pick10'
      self.matchscore
  #these are matching type games with a bonus ball ('mega_millions' || 'powerball' || 'cash4life' || 'nylotto')
    else
      self.bonusballscore
    end
  end

  def matchscore
    draw = self.draw
    pickarr = self.number.split(' ')
    drawarr = draw.number.split(' ')
    match = pickarr & drawarr
    return match.length.to_s
  end


  def bonusballscore
    draw = self.draw
    pickarr = self.number.split(' ')
    drawarr = draw.number.split(' ')
    power_pick = pickarr.pop
    power_draw = drawarr.pop
    match = pickarr & drawarr
      if power_pick == power_draw
        score = match.length.to_s + 'P'
      else
        score = match.length.to_s
      end
    return score
  end

  def powerball(score)
    multi = self.draw.multiplier.to_i
    case score
      when 'P'
        winnings = 4
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '1P'
        winnings = 4
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '2P'
        winnings = 7
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '3'
        winnings = 7
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '3P'
        winnings = 100
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '4'
        winnings = 100
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '4P'
        winnings = 10000
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '5'
        winnings = 1000000
        if self.multiplier
          winnings =  winnings * 2
        end
        self.update(result: "You won $#{winnings}")
      when '5P'
        self.update(result: "JACKPOT!!")
      else
        self.update(result: 'You did not win')
    end
  end

  def mega_millions(score)
    multi = self.draw.multiplier.to_i
    case score
      when 'P'
        winnings = 1
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '1P'
        winnings = 2
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '2P'
        winnings = 5
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '3'
        winnings = 5
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '3P'
        winnings = 50
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '4'
        winnings = 500
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '4P'
        winnings = 5000
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '5'
        winnings = 1000000
        if self.multiplier
          winnings =  winnings * multi
        end
        self.update(result: "You won $#{winnings}")
      when '5P'
        self.update(result: 'JACKPOT!!')
      else
        self.update(result: 'You did not win')
    end
  end

  def nylotto(score)
    case score
      when '3' || '3P'
        winnings = '5th place'
        self.update(result: "You won #{winnings}")
      when '4' || '4P'
        winnings = '4th place'
        self.update(result: "You won #{winnings}")
      when '5'
        winnings = '3rd place'
        self.update(result: "You won #{winnings}")
      when '5P'
        winnings = '2nd place'
        self.update(result: "You won #{winnings}")
      when '6P'
        self.update(result: 'JACKPOT!!')
      else
        self.update(result: 'You did not win')
    end
  end

  def cash4life(score)
    case score
      when '1P'
        winnings = 2
        self.update(result: "You won $#{winnings}")
      when '2'
        winnings = 4
        self.update(result: "You won $#{winnings}")
      when '2P'
        winnings = 10
        self.update(result: "You won $#{winnings}")
      when '3'
        winnings = 25
        self.update(result: "You won $#{winnings}")
      when '3P'
        winnings = 100
        self.update(result: "You won $#{winnings}")
      when '4'
        winnings = 500
        self.update(result: "You won $#{winnings}")
      when '4P'
        winnings = 2500
        self.update(result: "You won $#{winnings}")
      when '5'
        self.update(result: 'You won $1,000 a week for Life}')
      when '5P'
        self.update(result: 'You won $1,000 a day for Life')
      else
        self.update(result: 'You did not win')
    end
  end

  def take5(score)
    case score
      when '2'
        self.update(result: 'You won a free play')
      when '3'
        self.update(result: 'You won 3rd place')
      when '4'
        self.update(result: 'You won 2nd place')
      when '5'
        self.update(result: 'You won 1st place')
      else
        self.update(result: 'You did not win')
    end
  end

  def pick10(score)
    case score
      when '0'
        winnings = 4
        self.update(result: "You won $#{winnings}")
      when '6'
        winnings = 10
        self.update(result: "You won $#{winnings}")
      when '7'
        winnings = 40
        self.update(result: "You won $#{winnings}")
      when '8'
        winnings = 300
        self.update(result: "You won $#{winnings}")
      when '9'
        winnings = 6000
        self.update(result: "You won $#{winnings}")
      when '10'
        winnings = 500000
        self.update(result: "You won $#{winnings}")
      else
        self.update(result: 'You did not win')
    end
  end
end

