FactoryGirl.define do
  factory :pick do
    number { Faker::Number.number(12) }
    draw_date { Faker::Time.between(30.days.ago, Time.now) }
    password { Faker::Internet.password }
    game { "powerball" }
    user_id {Faker::Number.number(3)}
    multiplier { 3 }
  end

  factory :failed_pick do
    draw_date { Faker::Time.between(30.days.ago, Time.now) }
    password { Faker::Internet.password }
    game { "powerball" }
    user_id {Faker::Number.number(3)}
    multiplier { 3 }
  end
end