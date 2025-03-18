# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

User.destroy_all
puts "Users destroyed"
Cellar.destroy_all
puts "Cellars destroyed"
Slot.destroy_all
puts "Slots destroyed"

user1 = User.create!(email: "gerard@gmail.com", first_name: "Gérard", last_name: "La Villageoise", password: "abcdefg")

Cellar.create!(user: user1, height: 5, width: 5)

bottle_attributes = [{

  url:"https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/kzwmhvmlsilnx0sxvp0s.jpg"},
  "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/ee0dshe1w0mcyasfxw5y.jpg",
  "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/upexmfgxvnwznyzptrws.jpg",
  "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/dpz8aldx6uo3t89iaekx.jpg",
  "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/uyauggtzlpxzvi1zfl1u.jpg",
  "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/yhkpvq03fhatqx1wlqzi.jpg",
  "https://res.cloudinary.com/dsidliem1/image/upload/v1742291797/Cavinum/o3qlcvzqzkirdy25b57w.jpg",
  "https://res.cloudinary.com/dsidliem1/image/upload/v1742291797/Cavinum/pfg7a0fjtfh5dwqkp3ij.jpg",
  "https://res.cloudinary.com/dsidliem1/image/upload/v1742291797/Cavinum/rw94z7qps8mg1lgwarvv.jpg",
  "https://res.cloudinary.com/dsidliem1/image/upload/v1742291797/Cavinum/mv0a1hryljvkd56wvco0.jpg"]

bottles_data = [
  {
    name: "Gargalou",
    appellation: "Cotes de Gascogne",
    kind: "Blanc",
    vintage: 2020,
    area: "Sud-Ouest",
    variety: "Gros manseng",
    notes: "Raffiné avec des notes de brioche et de zeste d'agrumes.",
    image_url: "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/kzwmhvmlsilnx0sxvp0s.jpg"
  },
  {
    name: "Chateaux Mondotte Bellisle",
    appellation: "Saint-Emilion Grand Cru",
    kind: "Rouge",
    vintage: 1993,
    area: "Bordeaux",
    variety: "Cabernet Sauvignon, cabernet franc",
    notes: "Élégant, avec des tons terreux et une finition veloutée.",
    image_url: "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/ee0dshe1w0mcyasfxw5y.jpg"
  },
  {
    name: "La Marche",
    appellation: "Bourgogne Pinot noir",
    kind: "Rouge",
    vintage: 2018,
    area: "Bourgogne",
    variety: "Pinot noir",
    notes: "Corsé avec des tanins doux et une longue finale.",
    image_url: "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/upexmfgxvnwznyzptrws.jpg"
  },
  {
    name: "Le Mas Saint-Hugues",
    appellation: "Côtes du Rhone",
    kind: "Rouge",
    vintage: 2019,
    area: "Côtes du Rhone",
    variety: "Syrah, Grenache",
    notes: "Notes boisées, d'épices, de vanille et de café.",
    image_url: "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/dpz8aldx6uo3t89iaekx.jpg"
  },
  {
    name: "La Poule aux oeufs d'or",
    appellation: "Vins de France",
    kind: "Blanc doux",
    vintage: 2018,
    area: "Sud-ouest",
    variety: "Petit et gros manseng",
    notes: "Ce vin blanc à la robe jaune doré offre un nez d'agrumes et de raisins frais.",
    image_url: "https://res.cloudinary.com/dsidliem1/image/upload/v1742291798/Cavinum/uyauggtzlpxzvi1zfl1u.jpg"
  }
]

bottles_data.each_with_index do |bottle_attribute, index|
  bottle = Bottle.new(name: bottle_attribute[:name], appellation: bottle_attribute[:appellation], kind: bottle_attribute[:kind], vintage: bottle_attribute[:vintage], area: bottle_attribute[:area], variety: bottle_attribute[:variety], notes: bottle_attribute[:notes])
  bottle.slot = Slot.all[index]
  file = URI.parse(bottle_attribute[:image_url]).open
  bottle.photo.attach(io: file, filename: "bottle.jpg", content_type: "image/jpg")
  bottle.save
end
