
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
end
