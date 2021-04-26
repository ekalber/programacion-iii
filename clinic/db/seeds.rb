# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Doctor.populate 500 do | d |
    d.first_name = Faker::Name.first_name
    d.last_name = Faker::Name.last_name
    d.speciality_id = Speciality.first.id
end