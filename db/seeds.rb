require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Booking.destroy_all
Workspace.destroy_all
User.destroy_all

# Add team users to database
User.create!(username: 'tulip', first_name: 'Maya', last_name: 'Eyal',
             phone_number: '0004445556', email: 'tulip@airoffice.com', password: '123456')
User.create!(username: 'alice', first_name: 'Alice', last_name: 'Bardon Catineau',
             phone_number: '012345678', email: 'alice@airoffice.com', password: '123456')
User.create!(username: 'timothy', first_name: 'Timothy', last_name: 'Olaonipekun Omoniyi',
             phone_number: '14756538739', email: 'tim@airoffice.com', password: '123456')

emails = ["alice@gmail.com", "tom@gmail.com", "maya@outlook.com", "thib@gmail.com", "sonja@outlook.com"]
emails.each do |email|
  username = "#{Faker::Internet.user_name}#{rand(1..99)}"
  username = "#{Faker::Internet.user_name}#{rand(1..99)}" while username.length < 4

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  phone_number = Faker::PhoneNumber.phone_number
  password = "123456"
  User.create!(username:, first_name:, last_name:,
               phone_number:, email:, password:)
end

neighborhoods = %w[Gracia Raval Gotico Montjuic Eixample]
10.times do
  name = Faker::Coffee.blend_name
  address = Faker::Address.street_address
  neighborhood = neighborhoods.sample
  price = rand(50..100)
  user = User.all.sample
  ws = Workspace.create!(name:, address:, neighborhood:, price:, user:)
end

workspaces = Workspace.all
users = User.all
workspaces.each do |ws|
  rand_user = users.sample
  rand_user = users.sample while rand_user == ws.user

  start_date = rand(Date.today..Date.civil(2023, 12, 31))
  end_date = start_date + rand(1..31)
  Booking.create!(workspace: ws, user: rand_user, start_date:, end_date:)
end
