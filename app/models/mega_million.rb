class MegaMillion < Draw
  def get_data!
    uri = URI("https://data.ny.gov/api/views/5xaw-6ayf/rows.json?accessType=DOWNLOAD")
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      result = JSON.parse(response.body)
      result["data"].each do |drawing|
        draw = MegaMillion.new(number: (drawing[9] + ' ' + drawing[10]), draw_date: drawing[8], multiplier: drawing[11])
        draw.save
      end
    end
  end

  def set_date(pick)
    draw_date = pick.draw_date
    until [2, 5].include?(Date.parse(draw_date.to_s).cwday)
      draw_date += 24 * 60 * 60
    end
    Date.parse((draw_date.to_s)[0..9])
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
        winnings = 1
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '1P'
        winnings = 2
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '2P'
        winnings = 5
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '3'
        winnings = 5
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '3P'
        winnings = 50
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '4'
        winnings = 500
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '4P'
        winnings = 5000
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '5'
        winnings = 1000000
        if pick_multi
          winnings =  winnings * multi
        end
        return "You won $#{winnings}"
      when '5P'
        return 'JACKPOT!!'
      else
        return 'You did not win'
    end
  end
end




