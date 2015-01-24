Pick.create(number: '11 12 15 28 57 23', game: 'powerball', draw_date: Faker::Date.backward(2), user_id: 1, draw_id: 1)
Pick.create(number: '31 35 77 79 63 06', game: 'powerball', draw_date: Faker::Date.backward(5), user_id: 1, draw_id: 2)
Pick.create(number: '31 35 56 57 77 06', game: 'powerball', draw_date: Faker::Date.backward(8), user_id: 2, draw_id: 3)
Pick.create(number: '37 77 56 59 63 06', game: 'powerball', draw_date: Faker::Date.backward(8), user_id: 2, draw_id: 3)
Pick.create(number: '31 35 57 77 73 06', game: 'powerball', draw_date: Faker::Date.backward(11), user_id: 3, draw_id: 4)
Pick.create(number: '37 77 77 59 63 06', game: 'powerball', draw_date: Faker::Date.backward(11), user_id: 4, draw_id: 4)


User.create(username: 'steph', phone: Faker::PhoneNumber.phone_number, password: '1234567', email: 'steph@steph.com', active: true)
User.create(username: 'daniel', phone: Faker::PhoneNumber.phone_number, password: '123456', email: 'daniel@daniel.com', active: true)
User.create(username: 'dan', phone: Faker::PhoneNumber.phone_number, password: '123456', email: 'dan@dan.com', active: true)
User.create(username: 'carl', phone: Faker::PhoneNumber.phone_number, password: '123456', email: 'carl@carl.com', active: true)
d = Draw.new
d.get_data(d.powerball)
d.get_data(d.mega_millions)
d.get_data(d.nylotto)
d.get_data(d.cash4life)
d.get_data(d.take5)
d.get_data(d.pick10)
5.times do
  User.create(username: Faker::Name.first_name, phone: Faker::Number.number(10), password: '123456', email: Faker::Internet.email, active: false)
end
