require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# comment
emails = ["alice@gmail.com", "tom@gmail.com", "maya@outlook.com", "thib@gmail.com", "sonja@outlook.com"]

emails.each do |email|
  username = Faker::Esport.player
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  phone_number = Faker::PhoneNumber.phone_number
  password = "123456"
  User.create(username: username, first_name: first_name, last_name: last_name,
    phone_number: phone_number, email: email, password: password)
end

neighborhoods = %w[Gracia Raval Gotico Montjuic Eixample]
10.times do
  name = Faker::Coffee.blend_name
  address = Faker::Address.street_address
  neighborhood = neighborhoods.sample
  price = rand(50..100)
  user = User.all.sample
  Workspace.create(name: name, address: address, neighborhood: neighborhood, price: price, user: user)
end
