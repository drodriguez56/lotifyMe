FactoryGirl.define do
  factory :pick do
    numbers { Faker::Number.number(10) }
    date { Faker::Date.between(10.days.ago, Date.today) }
    password { Faker::Internet.password }
  end
end