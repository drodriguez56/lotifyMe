FactoryGirl.define do
  factory :draw_powerball, class: Powerball do
    draw_date { '24-01-2015' }
    multiplier { 2 }
    number { '11 12 13 14 15 16' }
  end

  factory :draw_mega_millions, class: MegaMillion do
    draw_date { '21-01-2015' }
    multiplier { 2 }
    number { '11 12 13 14 15 16' }
  end

  factory :draw_nylotto, class: NyLotto do
    draw_date { '17-01-2015' }
    number { '11 12 13 14 15 16 17' }
  end

  factory :draw_cash4life, class: Cash4Life do
    draw_date { '14-01-2015' }
    number { '11 12 13 14 15 16' }
  end

  factory :draw_take5, class: Take5 do
    draw_date { '14-01-2015' }
    number { '11 12 13 14 15' }
  end

  factory :draw_pick10, class: Pick10 do
    draw_date { '14-01-2015' }
    number { '11 12 13 14 15 16 17 18 19 20' }
  end
end