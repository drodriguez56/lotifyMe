Pick.create(number: '313556596306', game: 'powerball', draw_date: Faker::Time.between(30.days.ago, Time.now), user_id: 1)
Pick.create(number: '313577796306', game: 'powerball', draw_date: Faker::Time.between(30.days.ago, Time.now), user_id: 1)
Pick.create(number: '313556577706', game: 'powerball', draw_date: Faker::Time.between(30.days.ago, Time.now), user_id: 2)
Pick.create(number: '377756596306', game: 'powerball', draw_date: Faker::Time.between(30.days.ago, Time.now), user_id: 2)
Pick.create(number: '313557777306', game: 'powerball', draw_date: Faker::Time.between(30.days.ago, Time.now), user_id: 3)
Pick.create(number: '377777596306', game: 'powerball', draw_date: Faker::Time.between(30.days.ago, Time.now), user_id: 4)


User.create(username: 'steph', phone: Faker::PhoneNumber.phone_number, password: '123', email: 'steph@steph.com', active: true)
User.create(username: 'daniel', phone: Faker::PhoneNumber.phone_number, password: '123', email: 'daniel@daniel.com', active: true)
User.create(username: 'dan', phone: Faker::PhoneNumber.phone_number, password: '123', email: 'dan@dan.com', active: true)
User.create(username: 'carl', phone: Faker::PhoneNumber.phone_number, password: '123', email: 'carl@carl.com', active: true)

5.times do
  User.create(username: Faker::Name.name, phone: Faker::Number.number(10), password: '123', email: Faker::Internet.email, active: false)
end