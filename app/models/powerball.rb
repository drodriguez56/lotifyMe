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
end