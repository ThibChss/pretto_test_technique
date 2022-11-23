# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying credits..."
Credit.destroy_all
puts "...Done!"

puts "Creating credits..."
Credit.create(borrowed_amount: 300_000, duration: 240, nominal_rate: 1.7,
              guarante_fee: 1500, application_fee: 500, insurance_rate: 0.3)
puts "...Done!"
