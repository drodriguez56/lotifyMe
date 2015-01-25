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

  factory :draw_nylotto, class: Draw do
    draw_date { '17-01-2015' }
    game { "nylotto" }
    number { '11 12 13 14 15 16 17' }
  end

  factory :draw_cash4life, class: Draw do
    draw_date { '14-01-2015' }
    game { "cash4life" }
    number { '11 12 13 14 15 16' }
  end

  factory :draw_take5, class: Draw do
    draw_date { '14-01-2015' }
    game { "take5" }
    number { '11 12 13 14 15' }
  end

  factory :draw_pick10, class: Draw do
    draw_date { '14-01-2015' }
    game { "pick10" }
    number { '11 12 13 14 15 16 17 18 19 20' }
  end
end