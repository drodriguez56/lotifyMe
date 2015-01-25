FactoryGirl.define do
  factory :draw_powerball, class: Draw do
    draw_date { '24-01-2015' }
    game { "powerball" }
    multiplier { 2 }
    number { '11 12 13 14 15 16' }
  end

  factory :draw_mega_millions, class: Draw do
    draw_date { '21-01-2015' }
    game { "mega_millions" }
    multiplier { 2 }
    number { '11 12 13 14 15 16' }
  end
end