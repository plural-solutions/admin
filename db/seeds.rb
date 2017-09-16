# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Inserting Restaurants.."
restaurante = Restaurant.find_or_create_by!(name: 'Bar do zé')

puts "Inserting AdminUsers.."
restaurante.users.create!(
  email: 'admin@menyoo.com.br',
  password: '123456',
  role: 'admin'
)

restaurante.users.create!(
  email: 'chef@menyoo.com.br',
  password: '123456',
  role: 'chef'
)
