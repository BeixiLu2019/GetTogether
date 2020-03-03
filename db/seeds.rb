# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Activity.destroy_all

puts 'creating Activities'
Activity.create!(name: 'Dinner at Tim Raue', description: 'Join me at the best restaurant in Berlin!', address: "Rudi-Dutschke-Straße 26, 10969 Berlin", category: "food", datetime: DateTime.new(2020, 03, 4, 18, 30, 0), capacity: 3, user_id: User.first.id )
Activity.create!(name: 'Bouldering at Berta Block', description: 'Come boulder with me!', address: "Mühlenstraße 62, 13187 Berlin", category: "fitness", datetime: DateTime.new(2020, 03, 4, 16, 30, 0), capacity: 5, user_id: User.first.id )
Activity.create!(name: 'Yoga at Jivamukti Yoga Berlin', description: "Let's do Yoga together!" , address: " Brunnenstraße 29, Hof III (Alte Backfabrik), 10119 Berlin-Mitte", category: "fitness", datetime: DateTime.new(2020, 03, 4, 9, 30, 0), capacity: 3, user_id: User.first.id )

puts 'Activities created'
