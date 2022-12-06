require "rails_helper"

RSpec.describe "books page" do
  before(:each) do
    @library1 = Library.create!(city: "Denver", name:"Denver Public Library", computer_lab: true)
    @library2 = Library.create!(city: "Colorado Spring", name:"Colorado Springs Public Library", computer_lab: false)
    @book1 = @library1.books.create!(name: "Fairy Tale", IBN: 978166800, available: true)
    @book2 = @library1.books.create!(name: "The Boy From Biloxi", IBN: 97803855, available: false)
    @book3 = @library2.books.create!(name: "Lessons in Chemisty", IBN: 978038554, available: true)
  end

  describe 'user story 14' do
    it "has a link to update child" do
      books = @library1.books.create!(name: "Hngry Hippos", IBN: 1111111111111, available: true)
      visit "/books/#{books.id}"

      expect(page).to have_content("Edit Book")
      click_link("Edit Book")

      expect(current_path).to eq("/books/#{books.id}/edit")
    end

    it 'can edit the child' do
      books = @library1.books.create!(name: "Hngry Hippos", IBN: 1111111111111, available: true)
      
      visit "/books/#{books.id}"
      expect(page).to have_link("Edit Book")
      click_link("Edit Book")

      fill_in 'name', with: "Hungry Hippos"
      click_button "Update Book"

      expect(current_path).to eq("/books")
      expect(page).to have_content("Hungry Hippos")
    end
  end

end