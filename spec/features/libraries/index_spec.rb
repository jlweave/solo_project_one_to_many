require 'rails_helper'

RSpec.describe "library index page" do
  before(:each) do
    @library1 = Library.create!(city: "Denver", name:"Denver Public Library", computer_lab: true)
    @library2 = Library.create!(city: "Colorado Spring", name:"Colorado Springs Public Library", computer_lab: false)
    # @book1 = @library1.book.create!(name: "Fairy Tale", IBN: 9781668002179, available: true)
    # @book2 = @library1.book.create!(name: "The Boy From Biloxi", IBN: 9780385548922, available: false)
    # @book3 = @library2.book.create!(name: "Lessons in Chemisty", IBN: 9780385549400, available: true)
  end

  describe "user story 1" do
    describe "For each parent table, as a visitor" do
      it "When I visit '/parents', Then I see the name of each parent record in the system" do
        #require 'pry'; binding.pry
        visit "/libraries"

        expect(page).to have_content(@library1.name)
        expect(page).to have_content(@library2.name)                   
      end
    end
  end


end