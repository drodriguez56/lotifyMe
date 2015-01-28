class Powerball < Draw

  def get_data!
    uri = URI("https://data.ny.gov/api/views/d6yy-54nr/rows.json?accessType=DOWNLOAD")
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      result = JSON.parse(response.body)
      result["data"].each do |drawing|
        draw = Powerball.new(number: drawing[9], draw_date: drawing[8], multiplier: drawing[10])
        draw.save
      end
    end
  end

  def find_score(pick)
    pickarr = pick.number.split(' ')
    drawarr = self.number.split(' ')
    power_pick = pickarr.pop
    power_draw = drawarr.pop
    match = pickarr & drawarr
      if power_pick == power_draw
        score = match.length.to_s + 'P'
      else
        score = match.length.to_s
      end
      pick_multi = pick.multiplier
      self.translate_score(pick_multi, score)
  end

  def translate_score(pick_multi, score)
    multi = self.multiplier.to_i
    case score
      when 'P'
        winnings = 4
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '1P'
        winnings = 4
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '2P'
        winnings = 7
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '3'
        winnings = 7
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '3P'
        winnings = 100
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '4'
        winnings = 100
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '4P'
        winnings = 10000
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '5'
        winnings = 1000000
        if pick_multi
          winnings =  winnings * 2
        end
        return "You won $#{winnings}"
      when '5P'
        return "JACKPOT!!"
      else
        return 'You did not win'
    end
  end
end