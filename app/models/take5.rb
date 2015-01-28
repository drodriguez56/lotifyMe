class Take5 < Draw
  def get_data!
    uri = URI("https://data.ny.gov/api/views/dg63-4siq/rows.json?accessType=DOWNLOAD")
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      result = JSON.parse(response.body)
      result["data"].each do |drawing|
        draw = Take5.new(number: (drawing[9]), draw_date: drawing[8])
        draw.save
      end
    end
  end

  def find_score(pick)
    pickarr = pick.number.split(' ')
    drawarr = self.number.split(' ')
    match = pickarr & drawarr
    translate_score(match.length.to_s)
  end

  def translate_score(score)
    case score
      when '2'
        return 'You won a free play'
      when '3'
        return 'You won 3rd place'
      when '4'
        return 'You won 2nd place'
      when '5'
        return 'You won 1st place'
      else
        return 'You did not win'
    end
  end
end

