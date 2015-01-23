FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end

  factory :invalid_user, class:Hash do
    username { "" }
    email { "" }
    password { "" }
  end
end