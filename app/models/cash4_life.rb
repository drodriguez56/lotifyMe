class Cash4Life < Draw
  def get_data!
    uri = URI("https://data.ny.gov/api/views/kwxv-fwze/rows.json?accessType=DOWNLOAD")
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      result = JSON.parse(response.body)
      result["data"].each do |drawing|
        draw = Cash4Life.new(number: (drawing[9] + ' ' + drawing[10]), draw_date: drawing[8])
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
      self.translate_score(score)
  end

  def translate_score(score)
    case score
      when '1P'
        winnings = 2
        return "You won $#{winnings}"
      when '2'
        winnings = 4
        return "You won $#{winnings}"
      when '2P'
        winnings = 10
        return "You won $#{winnings}"
      when '3'
        winnings = 25
        return "You won $#{winnings}"
      when '3P'
        winnings = 100
        return "You won $#{winnings}"
      when '4'
        winnings = 500
        return "You won $#{winnings}"
      when '4P'
        winnings = 2500
        return "You won $#{winnings}"
      when '5'
        return 'You won $1,000 a week for Life}'
      when '5P'
        return 'You won $1,000 a day for Life'
      else
        return 'You did not win'
    end
  end
end
