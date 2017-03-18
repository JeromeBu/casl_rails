
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Activity.destroy_all
User.destroy_all

Activity.create!(title: "Judo", subtitle: "Bienvenue au dojo", max_participants: 50)
Activity.create!(title: "Tennis", max_participants: 60)
Activity.create!(title: "Bridge", max_participants: 50)
Activity.create!(title: "Musique", max_participants: 60)

User.create!(email: "jerome@mail.com",admin: true, password: "azerty", civility: "M." ,first_name: "Jérôme", last_name: "Burkard", address: "Paris", main_phone: "067898")
User.create!(email: "jerome2@mail.com", password: "azerty", civility: "M." ,first_name: "Jérôme", last_name: "Burkard", address: "Paris", main_phone: "067898")


puts "seeding went well !"
