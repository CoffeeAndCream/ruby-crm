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
Source.create!(source_type: 'Website')
Source.create!(source_type: 'Home Advisor')
Source.create!(source_type: 'Radio')
Source.create!(source_type: 'Friend or Family Referral')
Source.create!(source_type: 'Google Adwords')
Source.create!(source_type: 'Employee Referral')
Source.create!(source_type: 'Previous Customer')
User.create!(role: 'admin', email: 'info@legacy-exteriors.com', password: 'L3g@cy3111!', password_confirmation: 'L3g@cy3111!', first_name: 'Administrator')
