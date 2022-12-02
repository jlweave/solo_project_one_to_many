require "rails_helper"

RSpec.describe "books show page" do
  before(:each) do
    @library1 = Library.create!(city: "Denver", name:"Denver Public Library", computer_lab: true)
    @library2 = Library.create!(city: "Colorado Spring", name:"Colorado Springs Public Library", computer_lab: false)
    @book1 = @library1.books.create!(name: "Fairy Tale", IBN: 978166800, available: true)
    @book2 = @library1.books.create!(name: "The Boy From Biloxi", IBN: 97803855, available: false)
    @book3 = @library2.books.create!(name: "Lessons in Chemisty", IBN: 978038554, available: true)
  end

  describe "User story 4" do
    describe "As a visitor when I visit '/child_table_name/:id" do
      it "Then I see the child with that id including the child's attributes" do
        visit "/books/#{@book1.id}"
        expect(page).to have_content(@book1.name)
      end
    end
  end

end