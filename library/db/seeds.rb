# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.delete_all
Book.delete_all
Category.delete_all

Author.populate 5 do | a |
    a.first_name = Faker::Name.first_name
    a.last_name = Faker::Name.last_name
end

Category.populate 20 do |c|
    c.name = Faker::Book.genre #=> "Mystery"

    Book.populate 2 do | b |
        b.title = Faker::Book.title
        b.category_id = c.id
    end
end

Book.all.each do | b |
    b.authors = Author.all.limit(2)
    b.save
end