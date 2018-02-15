# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


15.times do
    User.create!(
    username: Faker::Kpop.solo,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10, 20, true, true)
    )
  end
  
  @users = User.all
  
  50.times do
    Wiki.create!(
    title: Faker::Lorem.sentence(3, false, 1),
    body: Faker::Lorem.paragraph(2, true),
    user: @users.sample
    )
  end
  
  puts "Created & Seeded #{User.count} Users to the database."
  puts "Created & Seeded #{Wiki.count} Wikis to the database."