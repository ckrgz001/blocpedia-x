# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


15.times do |n|   
    username = "#{Faker::WorldOfWarcraft.hero}#{n}"        
    User.create!(
    username: username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10, 20, true, true)
    )
  end
  
  @users = User.all
  
  20.times do
    Wiki.create!(
    title: Faker::Lorem.sentence(3, false, 1),
    body: Faker::Lorem.paragraph(2, true),
    user: @users.sample,
    private: false
    )
  end
  
  5.times do
    Wiki.create!(
    title: Faker::Lorem.sentence(3, false, 1),
    body: Faker::Lorem.paragraph(2, true),
    user: @users.sample,
    private: true
    )
  end

  puts "Created & Seeded #{User.count} Users to the database."
  puts "Created & Seeded #{Wiki.count} Public Wikis to the database."
  puts "Created & Seeded #{Wiki.count} Private Wikis to the database."