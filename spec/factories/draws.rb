FactoryGirl.define do
  factory :draw, class: Draw do
    draw_date { '24-01-2015' }
    game { "powerball" }
    multiplier { rand(1..5) }
    number { '11 12 13 14 15 16' }
  end
end