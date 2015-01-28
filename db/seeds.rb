User.create(username: 'steph', phone: Faker::PhoneNumber.phone_number, password: '1234567', email: 'steph@steph.com', active: true)
User.create(username: 'daniel', phone: Faker::PhoneNumber.phone_number, password: '123456', email: 'daniel@daniel.com', active: true)
User.create(username: 'dan', phone: Faker::PhoneNumber.phone_number, password: '123456', email: 'dan@dan.com', active: true)
User.create(username: 'carl', phone: Faker::PhoneNumber.phone_number, password: '123456', email: 'carl@carl.com', active: true)
p = Powerball.new
p.get_data!
m = MegaMillion.new
m.get_data!
n = NyLotto.new
n.get_data!
c = Cash4Life.new
c.get_data!
t = Take5.new
t.get_data!
p = Pick10.new
p.get_data!

5.times do
  User.create(username: Faker::Name.first_name, phone: Faker::Number.number(10), password: '123456', email: Faker::Internet.email, active: false)
end

Pick.create(number: '16 19 20 29 33 10', game: 'powerball', draw_date: '2015-01-24', user_id: 1, draw_id: 1)
Pick.create(number: '77 77 15 28 57 23', game: 'powerball', draw_date: '2015-01-21', user_id: 1, draw_id: 2)
Pick.create(number: '31 35 56 57 77 06', game: 'powerball', draw_date: Faker::Date.backward(9), user_id: 2, draw_id: 3)
Pick.create(number: '37 77 56 59 63 06', game: 'powerball', draw_date: Faker::Date.backward(9), user_id: 2, draw_id: 3)
Pick.create(number: '31 35 57 77 73 06', game: 'powerball', draw_date: Faker::Date.backward(12), user_id: 3, draw_id: 4)
Pick.create(number: '37 77 77 59 63 06', game: 'powerball', draw_date: Faker::Date.backward(12), user_id: 4, draw_id: 4)
