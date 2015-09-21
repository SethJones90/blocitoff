require 'faker'

#Create Users
5.times do 
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   'helloworld'
  )
  user.save!
end
users = User.all

#Create items
100.times do
  Item.create!(
    user:  users.sample,
    name:   Faker::Lorem.characters(10)
  )
end
items = Item.all  

user = User.first
user.update_attributes!(
  name:       'Seth Jones',
  email: 'sethjmusic@gmail.com',
  password: 'helloworld'
 )

puts "Seed finished"
puts "#{Item.count} bookmarks created!"
