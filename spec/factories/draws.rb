FactoryGirl.define do
  factory :draw, class: Pick do
    draw_date { Time.now }
    password { Faker::Internet.password }
    game { "powerball" }
    multiplier { rand(1..5) }
    number { '11 11 11 11 11 11' }
  end
end