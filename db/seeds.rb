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
require "open-uri"



puts 'Cleaning review database'
Review.destroy_all

puts 'Cleaning messages...'

Message.destroy_all
Conversation.destroy_all

puts 'Cleaning booking database...'
Booking.destroy_all


puts 'Cleaning activity database...'
Activity.destroy_all

puts 'Cleaning user database'
User.destroy_all

puts 'creating Users'
file = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583243051/d6c9ok8T8c1CtnbTpgCEbNnz.jpg')
user = User.create!(
  first_name: "Philipp",
  last_name: "Hamm",
  email: "philipp.hamm@gmail.com",
  username: "Hammi",
  password: "000000",
  # birthdate: Date.new(1995,11,29),
  bio: "Everything under control",
  interest: "Music",
  )
user.photo.attach(io: file, filename: 'photo')

file1 = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583427020/Avatar_Anna_ibh3qf.jpg')
user1 = User.create!(
  first_name: "Anna",
  last_name: "Herzog",
  username: "Anni",
  email: "anna.herzog@gmail.com",
  password: "000000",
  # birthdate: Date.new(1996,08,11),
  bio: "I know where to go",
  interest: "Tech",
  )
  user1.photo.attach(io: file1, filename: 'photo1')

file = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583427024/Avatar_Ambar_z3njc4.jpg')
user = User.create!(
  first_name: "Amy",
  last_name: "Lu",
  username: "Beixi",
  email: "amy.lu@gmail.com",
  password: "000000",
  # birthdate: Date.new(1992,08,11),
  bio: "I love sweets",
  interest: "Cooking healty",
  )
  user.photo.attach(io: file, filename: 'photo')

file = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583427017/Avatar_Amy_lncwih.jpg')
user = User.create!(
  first_name: "Ambar",
  last_name: "Gonzalez",
  username: "Ambi",
  email: "ambar.gonzalez@gmail.com",
  password: "000000",
  # birthdate: Date.new(1993,08,11),
  bio: "Designing like a boss",
  interest: "I like to dance disco music",
  )
  user.photo.attach(io: file, filename: 'photo')

puts 'Users created'

puts 'creating Activities'

file = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583253419/Tim_Raue_o1sjdi.jpg')
activity = Activity.create!(
  name: 'Dinner at Tim Raue',
  description: 'Join me at the best restaurant in Berlin!',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  category: "food",
  datetime: DateTime.new(2020, 03, 9, 19, 00, 0),
  capacity: 3,
  user_id: User.first.id,
  # photos: ["cqmszae8rere14lnciwy"]
  )
  activity.photos.attach(io: file, filename: 'photo')

file = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583426660/Tennis_hfecbr.jpg')
activity = Activity.create!(
  name: 'Tennis in Kreuzberg',
  description: 'Move your body with me playing tennis. I am not very good. ',
  address: "Cantianstr. 24, 10437 Berlin",
  category: "sports",
  datetime: DateTime.new(2020, 03, 9, 19, 30, 0),
  capacity: 2,
  user_id: User.first.id,
  )
  activity.photos.attach(io: file, filename: 'photo')

file = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583253420/Berta_Block_vtnhva.jpg')
activity = Activity.create!(
  name: 'Bouldering at Berta Block',
  description: 'Come boulder with me!',
  address: "Mühlenstraße 62, 13187 Berlin",
  category: "sports",

  datetime: DateTime.new(2020, 04, 10, 16, 30, 0),

  capacity: 5,
  user_id: User.last.id)
  activity.photos.attach(io: file, filename: 'photo')

file = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583253419/Yoga_erxj9j.jpg')
activity =Activity.create!(
  name: 'Yoga at Jivamukti Yoga Berlin',
  description: "Let's do Yoga together!" ,
  address: " Brunnenstraße 29, 10119 Berlin",
  category: "sports",
  datetime: DateTime.new(2020, 03, 10, 9, 30, 0),
  capacity: 3,
  user_id: User.last.id - 1)
  activity.photos.attach(io: file, filename: 'photo')

file = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583248180/BtHrsTQUiNBDGrVzgsyGo7cQ.jpg')
activity = Activity.create!(
  name: 'Dinner at mine',
  description: "Let's cook together in my kitchen!" ,
  address: " Grünberger Straße, 10245 Berlin",
  category: "food",
  datetime: DateTime.new(2020, 05, 8, 9, 30, 0),
  capacity: 3,
  user_id: User.last.id)
  activity.photos.attach(io: file, filename: 'photo')

  file = URI.open('https://res.cloudinary.com/dvpcxhofq/image/upload/v1583248180/BtHrsTQUiNBDGrVzgsyGo7cQ.jpg')
activity = Activity.create!(
  name: 'Kater Blau',
  description: "Let's dance the night awayyyyyy in one of Berlin's most famous clubs!" ,
  address: "Holzmarktstraße 25, 10243 Berlin",
  category: "food",
  datetime: DateTime.new(2020, 03, 10, 19, 30, 0),
  capacity: 3,
  user_id: User.last.id - 2)
  activity.photos.attach(io: file, filename: 'photo')


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
  user_id: (User.first.id + 2),
  )

Booking.create!(
  activity_id: Activity.first.id + 2,
  user_id: User.last.id,
  )

Booking.create!(
  activity_id: Activity.first.id + 2,
  user_id: User.first.id + 1,
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
  user_id: User.first.id + 2,
  )

Booking.create!(
  activity_id: Activity.last.id,
  user_id: User.first.id,
  )


Booking.create!(
  activity_id: Activity.last.id,
  user_id: User.first.id + 2,
  )



puts 'Bookings created...'


puts 'Creating conversation and messages part 1...'

Conversation.create!(
  sender_id: User.last.id,
  recipient_id: User.first.id,
  activity_id: Activity.first.id
  )

Message.create!(
  user_id: User.last.id,
  conversation_id: Conversation.first.id,
  body: "Hi Philipp, I would like to join your event but I don't know if you are cool. Ambar"
  )

Message.create!(
  user_id: User.first.id,
  conversation_id: Conversation.first.id,
  body: "Hi Ambar, I am supercool. Don't worry and join the event.NOOOWW!!!"
  )

Message.create!(
  user_id: User.last.id,
  conversation_id: Conversation.first.id,
  body: "That's such a cool answer. Now I am very convinced to join the activity. Thank you so much."
  )

Message.create!(
  user_id: User.first.id,
  conversation_id: Conversation.first.id,
  body: "Coolio. See yaaa."
  )

puts 'Creating conversation and messages part 2...'

Conversation.create!(
  sender_id: User.first.id,
  recipient_id: User.first.id + 1,
  activity_id: Activity.first.id + 2
  )

Message.create!(
  user_id: User.first.id,
  conversation_id: Conversation.first.id + 1,
  body: "Hi Anna, nice event"
  )

Message.create!(
  user_id: User.first.id + 1,
  conversation_id: Conversation.first.id + 1,
  body: "I know"
  )

Message.create!(
  user_id: User.first.id,
  conversation_id: Conversation.first.id + 1,
  body: "Are you always that confident about your events"
  )

Message.create!(
  user_id: User.first.id + 1,
  conversation_id: Conversation.first.id + 1,
  body: "Yes"
  )

Message.create!(
  user_id: User.first.id,
  conversation_id: Conversation.first.id + 1,
  body: "Cool I join."
  )

puts 'Messages created...'


puts 'Creating reviews part 1...'

Review.create!(
  booking_id: Booking.first.id,
  content: "It was a super nice dinner, and i absolutely enjoyed it",
  activity_rating: 5
  )

Review.create!(
  booking_id: Booking.first.id + 1,
  content: "The dinner is very tasty! The cusine is inspired by asian flavors. Friendly staff and awesome service. Worthy the money:)",
  activity_rating: 5
  )

Review.create!(
  booking_id: Booking.first.id + 2,
  content: "The food is very good and very well presented, but it took too long!",
  activity_rating: 4
  )

Review.create!(
  booking_id: Booking.first.id + 3,
  content: "A spontaneous sports night! I don't play very well but Hammi was very helpful!",
  activity_rating: 5
  )

# Review.create!(
#   booking_id: Booking.find(129),
#   content: "so yummmmmmmy! loved Ambi's home-made dim sum! 🤤",
#   activity_rating: 5
#   )

# Review.create!(
#   booking_id: Booking.find(128),
#   content: "it was a fun night at Ambi's place! she is very international and definetly a lovely entertainer. thanks for the great experience 🤗",
#   activity_rating: 5
  # )

Review.create!(
  booking_id: Booking.first.id + 6,
  content: "nice yoga session!",
  activity_rating: 5
  )

Review.create!(
  booking_id: Booking.first.id + 7,
  content: "the studio is very cosy and not too crowded",
  activity_rating: 4,
  )

Review.create!(
  booking_id: Booking.first.id + 8,
  content: "The teacher's voice is very nice in a meditative way 😇",
  activity_rating: 5
  )

puts 'Reviews created...'












