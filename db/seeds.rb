# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

library1 = Library.create!(city: "Denver", name:"Denver Public Library", computer_lab: true)
library2 = Library.create!(city: "Colorado Spring", name:"Colorado Springs Public Library", computer_lab: false)
    # @book1 = @library1.book.create!(name: "Fairy Tale", IBN: 9781668002179, available: true)
    # @book2 = @library1.book.create!(name: "The Boy From Biloxi", IBN: 9780385548922, available: false)
    # @book3 = @library2.book.create!(name: "Lessons in Chemisty", IBN: 9780385549400, available: true)