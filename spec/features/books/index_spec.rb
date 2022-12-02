require "rails_helper"

RSpec.describe "books index page" do
  before(:each) do
    @library1 = Library.create!(city: "Denver", name:"Denver Public Library", computer_lab: true)
    @library2 = Library.create!(city: "Colorado Spring", name:"Colorado Springs Public Library", computer_lab: false)
    @book1 = @library1.books.create!(name: "Fairy Tale", IBN: 978166800, available: true)
    @book2 = @library1.books.create!(name: "The Boy From Biloxi", IBN: 97803855, available: false)
    @book3 = @library2.books.create!(name: "Lessons in Chemisty", IBN: 978038554, available: true)
  end

  describe "User story 3" do
    describe "When I vist child_table_name" do 
      it "Then I see each Child in the system including the Child's attributes" do
        visit "/books"
        expect(page).to have_content(@book1.name)
        expect(page).to have_content(@book2.name)
        expect(page).to have_content(@book3.name)
      end
    end
  end
end