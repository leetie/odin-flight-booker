# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
system 'rails db:drop'
system 'rails db:migrate'
# Airport.destroy_all
# Flight.destroy_all

#airports
Airport.create(name: "SFO")
Airport.create(name: "NYC")
Airport.create(name: "JFK")
Airport.create(name: "BOS")
Airport.create(name: "LAX")
Airport.create(name: "JAX")
Airport.create(name: "DFW")
Airport.create(name: "DEN")
Airport.create(name: "IVO")
Airport.create(name: "ATL")
Airport.create(name: "DXB")


#generate flights with random dates
20.times do |i|
  Flight.create(date: Date.new(
    2020, rand(6..12),
    rand(1..30)
  ))
end


#assign flights to random to/from airports
20.times do |i|
  f = Flight.find(i+1)
  rand_to_airport = rand(1..(Airport.count))
  f.to << Airport.find(rand_to_airport)
  #until rand_from_airport != rand_to_airport, reroll 
  rand_from_airport = rand_to_airport
  while rand_from_airport == rand_to_airport
    rand_from_airport = rand(1..(Airport.count))
  end
  #assign new value that is not equal to the to_airport to the from_airport
  f.from << Airport.find(rand_from_airport)
end



