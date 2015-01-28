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
end

