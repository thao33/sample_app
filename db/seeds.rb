# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: 'Admin', email: 'admin@gmail.com', password: 'foobaa',
              password_confirmation: 'foobaa', admin: true)

99.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 'secret'
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each {|user| user.microposts.create!(content: content)}
end

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..30]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}