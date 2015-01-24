FactoryGirl.define do
  factory :user do
    username { Faker::Lorem.characters(6) }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end

  factory :invalid_user, class:Hash do
    username { "" }
    email { "" }
    password { "" }
  end
end