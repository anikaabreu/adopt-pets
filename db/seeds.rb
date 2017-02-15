# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# PetCall.call({location: "Broward"}).pets.each_with_index do |pet, index|
#   if !pet["media"].nil?
#     Pet.create(name: pet["name"],
#               image: pet["media"]["photos"]["photo"][2]["__content__"],
#               description: pet["description"],
#               sex: pet["sex"],
#               age: pet["age"],
#               breed: pet["breeds"]["breed"],
#               size: pet["size"])
#   end
# end
PetCall.call({location: "Broward"})
