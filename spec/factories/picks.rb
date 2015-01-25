FactoryGirl.define do
  factory :pick do
    number { Faker::Number.number(12) }
    draw_date { Faker::Time.between(30.days.ago, Time.now) }
    password { Faker::Internet.password }
    game { "powerball" }
    user_id {Faker::Number.number(3)}
    multiplier { 3 }
  end

  factory :failed_pick, class: Pick do
    draw_date { Faker::Time.between(30.days.ago, Time.now) }
    password { Faker::Internet.password }
    game { "powerball" }
    user_id {Faker::Number.number(3)}
    multiplier { 3 }
  end

  factory :jackpot_pick, class: Pick do
    draw_date { '24-01-2015' }
    game { "powerball" }
    multiplier { true }
    number { '11 12 13 14 15 16' }
  end
end