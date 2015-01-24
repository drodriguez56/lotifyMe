require 'net/http'

class Draw < ActiveRecord::Base
  validates :number, presence: true
  validates :game, presence: true
  validates :draw_date, presence: true, uniqueness: true

  has_many :picks

  def get_data_powerball
    uri = URI("https://data.ny.gov/api/views/d6yy-54nr/rows.json?accessType=DOWNLOAD")
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      result = JSON.parse(response.body)
      result["data"].each do |drawing|
        draw = Draw.new(number: drawing[9], game: 2, draw_date: drawing[8], multiplier: drawing[10])
        draw.save
      end
    else
    end
  end
end
