require 'net/http'

class Draw < ActiveRecord::Base
  validates :number, presence: true
  validates :game, presence: true
  validates :draw_date, presence: true, uniqueness: true

  has_many :picks



  def get_data(type)
    uri = URI(type['url'])
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      result = JSON.parse(response.body)
      result["data"].each(&type['proc'])
    end
  end

  def powerball
    return { "url" => 'https://data.ny.gov/api/views/d6yy-54nr/rows.json?accessType=DOWNLOAD',
           "proc" => Proc.new { |drawing|
        draw = Draw.new(number: drawing[9], game: 'powerball', draw_date: drawing[8], multiplier: drawing[10])
        draw.save
      }
    }
  end

  def mega_millions
    return { "url" => "https://data.ny.gov/api/views/5xaw-6ayf/rows.json?accessType=DOWNLOAD",
           "proc" => Proc.new { |drawing|
        draw = Draw.new(number: (drawing[9] + ' ' + drawing[10]), game: 'mega_millions', draw_date: drawing[8], multiplier: drawing[11])
        draw.save
      }
    }
  end

  def nylotto
    return { "url" => "https://data.ny.gov/api/views/6nbc-h7bj/rows.json?accessType=DOWNLOAD",
           "proc" => Proc.new { |drawing|
        draw = Draw.new(number: (drawing[9] + ' ' + drawing[10]), game: 'nylotto', draw_date: drawing[8])
        draw.save
      }
    }
  end

  def cash4life
    return { "url" => "https://data.ny.gov/api/views/kwxv-fwze/rows.json?accessType=DOWNLOAD",
           "proc" => Proc.new { |drawing|
        draw = Draw.new(number: (drawing[9] + ' ' + drawing[10]), game: 'cash4life', draw_date: drawing[8])
        draw.save
      }
    }
  end

  def take5
    return { "url" => "https://data.ny.gov/api/views/dg63-4siq/rows.json?accessType=DOWNLOAD",
           "proc" => Proc.new { |drawing|
        draw = Draw.new(number: (drawing[9]), game: 'take5', draw_date: drawing[8])
        draw.save
      }
    }
  end

  def pick10
    return { "url" => "https://data.ny.gov/api/views/bycu-cw7c/rows.json?accessType=DOWNLOAD",
           "proc" => Proc.new { |drawing|
        draw = Draw.new(number: (drawing[9]), game: 'pick10', draw_date: drawing[8])
        draw.save
      }
    }
  end


end
