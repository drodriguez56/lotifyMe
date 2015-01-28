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
end
