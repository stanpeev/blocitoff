# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#Create Users
5.times do
  user = User.new(
     name:    Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Items
100.times do
item = Item.create!(
  user: users.sample,
  name: Faker::Lorem.sentence,
  )
end
items = Item.all 

#Create Member
 member = User.new(
  name: 'Stan Peev',
  email: 'stan.peev@gmail.com',
  password: 's15d27p13',
 )
 member.skip_confirmation!
 member.save!

puts "Seed finished"
puts "#{Item.count} topics created"
puts "#{User.count} users created"
