# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Service.create!(name: 'Roofing', color: '#aa42f4')
Service.create!(name: 'Gutters', color: '#cc8616')
Service.create!(name: 'Siding', color: '#cc1515')
Service.create!(name: 'Decking', color: '#aa116d')
Service.create!(name: 'Soffit', color: '#47bc38')
Service.create!(name: 'Windows', color: '#3866bc')
User.create!(first_name: 'Sean', last_name: 'Hulse', email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'admin')
User.create!(first_name: 'John', last_name: 'Bottensek', email: 'user@gmail.com', password: 'blanked', password_confirmation: 'blanked', role: 'none')
User.create!(first_name: 'Steve', last_name: 'Gilbertson', email: 'sgilbertson@legacy-exteriors.com', password: 'blanked', password_confirmation: 'blanked', role: 'none')
User.create!(first_name: 'Jimmie', last_name: 'Blanchard', email: 'jblanchard@legacy-exteriors.com', password: 'blanked', password_confirmation: 'blanked', role: 'none')
User.create!(first_name: 'Brock', last_name: 'Roder', email: 'broder@legacy-exteriors.com', password: 'blanked', password_confirmation: 'blanked', role: 'none')
500.times do |i|
  date = DateTime.new(2017,rand(1..12),rand(1..28))
  Event.create(title: Faker::Name.name, start: date, ends: date+1.hour, description: Faker::Job.title, user_id: rand(1..5))
end
1000.times do |i|
  Lead.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, created_at: DateTime.new(rand(2000..2017),rand(1..12),rand(1..28)), user_id: rand(1..5), email: 'test@gmail.com', phone: Faker::PhoneNumber.cell_phone, customer: rand(0..1))
end
