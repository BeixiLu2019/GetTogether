# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# resource_type = "image"
# type = "upload"
# version = 1234567890
# public_id = "fismpnq3zma80dc2ovjt"
# format = "jpg"
# signature = Cloudinary::Utils.api_sign_request({:public_id=>public_id,
# :version=>version}, Cloudinary.config.api_secret)
# photo = "#{resource_type}/#{type}/v#{version}/#{public_id}.#{format}##
# {signature}"



puts 'Cleaning booking database...'
Booking.destroy_all

puts 'Cleaning activity database...'
Activity.destroy_all

puts 'Cleaning user database'
User.destroy_all

puts 'creating Users'
User.create!(
  first_name: "Philipp",
  last_name: "Hamm",
  email: "philipp.hamm@gmail.com",
  username: "Hammi",
  password: "000000",
  # birthdate: Date.new(1995,11,29),
  bio: "Everything under control",
  interest: "Music",
  )

User.create!(
  first_name: "Anna",
  last_name: "Herzog",
  username: "Anni",
  email: "anna.herzog@gmail.com",
  password: "000000",
  # birthdate: Date.new(1996,08,11),
  bio: "I know where to go",
  interest: "Tech",
  )

User.create!(
  first_name: "Amy",
  last_name: "Lu",
  username: "Beixi",
  email: "amy.lu@gmail.com",
  password: "000000",
  # birthdate: Date.new(1992,08,11),
  bio: "I love sweets",
  interest: "Cooking healty",
  )

User.create!(
  first_name: "Ambar",
  last_name: "Gonzalez",
  username: "Ambi",
  email: "ambar.gonzalez@gmail.com",
  password: "000000",
  # birthdate: Date.new(1993,08,11),
  bio: "Designing like a boss",
  interest: "I like to dance disco music",
  )

puts 'Users created'

puts 'creating Activities'

Activity.create!(
  name: 'Dinner at Tim Raue',
  description: 'Join me at the best restaurant in Berlin!',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  category: "food",
  datetime: DateTime.new(2019, 03, 4, 18, 30, 0),
  capacity: 3,
  user_id: User.first.id,
  # photos: ["cqmszae8rere14lnciwy"]
  )

Activity.create!(
  name: 'Bouldering at Berta Block',
  description: 'Come boulder with me!',
  address: "Mühlenstraße 62, 13187 Berlin",
  category: "sports",
  datetime: DateTime.new(2020, 03, 4, 16, 30, 0),
  capacity: 5,
  user_id: User.first.id + 1)

Activity.create!(
  name: 'Yoga at Jivamukti Yoga Berlin',
  description: "Let's do Yoga together!" ,
  address: " Brunnenstraße 29, 10119 Berlin",
  category: "sports",
  datetime: DateTime.new(2020, 03, 4, 9, 30, 0),
  capacity: 3,
  user_id: User.last.id - 1)

Activity.create!(
  name: 'Dinner at mine',
  description: "Let's cook together in my kitchen!" ,
  address: " Grünberger Straße, 10245 Berlin",
  category: "food",
  datetime: DateTime.new(2020, 03, 4, 9, 30, 0),
  capacity: 3,
  user_id: User.last.id)


puts 'Activities created'


puts 'creating bookings'
Booking.create!(
  activity_id: Activity.first.id,
  user_id: (User.first.id + 1),
  )

Booking.create!(
  activity_id: Activity.first.id,
  user_id: User.first.id + 2,
  )

Booking.create!(
  activity_id: Activity.first.id,
  user_id: User.first.id + 3,
  )


Booking.create!(
  activity_id: Activity.first.id + 1,
  user_id: User.first.id,
  )

Booking.create!(
  activity_id: Activity.first.id + 1,
  user_id: User.first.id + 2,
  )

Booking.create!(
  activity_id: Activity.first.id + 1,
  user_id: User.first.id + 3,
  )



Booking.create!(
  activity_id: Activity.last.id - 1,
  user_id: User.first.id,
  )

Booking.create!(
  activity_id: Activity.last.id - 1,
  user_id: User.first.id + 1,
  )

Booking.create!(
  activity_id: Activity.last.id - 1,
  user_id: User.first.id + 3,
  )

Booking.create!(
  activity_id: Activity.last.id,
  user_id: User.first.id,
  )

Booking.create!(
  activity_id: Activity.last.id,
  user_id: User.first.id + 1,
  )

Booking.create!(
  activity_id: Activity.last.id,
  user_id: User.first.id + 2,
  )


puts 'Bookings created...'


















