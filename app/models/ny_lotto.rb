class NyLotto < Draw
  def get_data!
    uri = URI("https://data.ny.gov/api/views/6nbc-h7bj/rows.json?accessType=DOWNLOAD")
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      result = JSON.parse(response.body)
      result["data"].each do |drawing|
        draw = NyLotto.new(number: (drawing[9] + ' ' + drawing[10]), draw_date: drawing[8])
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
      when '3'
       winnings = '5th place'
       return "You won #{winnings}"
      when '3P'
       winnings = '5th place'
       return "You won #{winnings}"
      when '4'
       winnings = '4th place'
       return "You won #{winnings}"
      when '4P'
       winnings = '4th place'
       return "You won #{winnings}"
      when '5'
       winnings = '3rd place'
       return "You won #{winnings}"
      when '5P'
       winnings = '2nd place'
       return "You won #{winnings}"
      when '6P'
       return 'JACKPOT!!'
      else
       return 'You did not win'
   end
 end
end
