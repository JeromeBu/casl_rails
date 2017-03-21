
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Activity.destroy_all
User.destroy_all

judo = Activity.create!(title: "Judo", subtitle: "Bienvenue au dojo", max_participants: 50)
judo.photo_url = "http://res.cloudinary.com/dpmc03d5t/image/upload/v1489853980/CASL/oef6ei3lytwtd15mi5tz.jpg"

tennis = Activity.create!(title: "Tennis", subtitle: "A la volée", max_participants: 60)
tennis.photo_url = "http://res.cloudinary.com/dpmc03d5t/image/upload/v1489853519/CASL/ctztnn1d4kuus1tugxpy.jpg"

bridge = Activity.create!(title: "Bridge", max_participants: 50)
bridge.photo_url = "http://res.cloudinary.com/dpmc03d5t/image/upload/v1489853668/CASL/wzgybzu8lmgtpikcjwjf.jpg"

musique = Activity.create!(title: "Musique", max_participants: 60)
musique.photo_url = "http://res.cloudinary.com/dpmc03d5t/image/upload/v1489853642/CASL/lrkc6lcmteuguwkr0lxw.jpg"

User.create!(email: "jerome@mail.com",admin: true, password: "qsdfjk", civility: "M." ,first_name: "Jérôme", last_name: "Burkard", address: "Paris", main_phone: "067898")
User.create!(email: "jerome2@mail.com", password: "qsdfjk", civility: "M." ,first_name: "Jérôme", last_name: "Burkard", address: "Paris", main_phone: "067898", activity_admin: "Judo")


puts "seeding went well !"
