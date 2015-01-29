
class Pick10 < Draw
  def get_data!
  uri = URI("https://data.ny.gov/api/views/bycu-cw7c/rows.json?accessType=DOWNLOAD")
  response = Net::HTTP.get_response(uri)
    if response.code == "200"
      result = JSON.parse(response.body)
      result["data"].each do |drawing|
        draw = Pick10.new(number: (drawing[9]), draw_date: drawing[8])
        draw.save
      end
    end
  end

  def set_date(pick)
    draw_date = pick.draw_date
    until (1..6).to_a.include?(Date.parse(draw_date.to_s).cwday)
      draw_date += 24 * 60 * 60
    end
    Date.parse((draw_date.to_s)[0..9])
  end

  def find_score(pick)
    pickarr = pick.number.split(' ')
    drawarr = self.number.split(' ')
    match = pickarr & drawarr
    self.translate_score(match.length.to_s)
  end

  def translate_score(score)
    case score
      when '0'
        winnings = 4
        return "You won $#{winnings}"
      when '6'
        winnings = 10
        return "You won $#{winnings}"
      when '7'
        winnings = 40
        return "You won $#{winnings}"
      when '8'
        winnings = 300
        return "You won $#{winnings}"
      when '9'
        winnings = 6000
        return "You won $#{winnings}"
      when '10'
        winnings = 500000
        return "You won $#{winnings}"
      else
        return 'You did not win'
    end
  end
end
