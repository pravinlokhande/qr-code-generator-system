# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


rand_name = (0...10).map { (65 + rand(5)).chr }.join
0.upto(10).each {
  Qrgenerator.create!(name: rand_name)
}
