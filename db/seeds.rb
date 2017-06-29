# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.where(email: 'admin@example.com').first_or_create!(password: 'password')
user.websites.where(name: 'Website 1', subdomain: 'website1').first_or_create!
user.websites.where(name: 'Website 2', subdomain: 'website2').first_or_create!
