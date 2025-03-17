# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
puts "Users destroyed"
Cellar.destroy_all
puts "Cellars destroyed"
Slot.destroy_all
puts "Slots destroyed"

user1 = User.create!(email: "gerard@gmail.com", first_name: "Gérard", last_name: "La Villageoise", password: "abcdefg")

Cellar.create!(user: user1, height: 5, width: 5)
