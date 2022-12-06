# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe "Edit Parents page" do
  before(:each) do
    @library1 = Library.create!(city: "Denver", name:"Denver Public Library", computer_lab: true, phone_number: 7208651111)
    @library2 = Library.create!(city: "Colorado Spring", name:"Colorado Springs Public Library", computer_lab: false, phone_number: 7195316333)
    @book1 = @library1.books.create!(name: "Fairy Tale", IBN: 9781668002179, available: true)
    @book2 = @library1.books.create!(name: "The Boy From Biloxi", IBN: 9780385548922, available: false)
    @book3 = @library2.books.create!(name: "Lessons in Chemisty", IBN: 9780385549400, available: true)
    @book4 = @library2.books.create!(name: "The Light We Carry: Overcoming in Uncertain Times", IBN: 9780593237465, available: false)
    @book5 = @library2.books.create!(name: "If He Had Been with Me", IBN: 9781728205489, available: true)
  end

  describe "user story 12" do
    describe "When I visit the parents show page" do
      it "links to an edit page" do
        libraries = Library.create!(name: 'Delavan Public Library', city: 'Delavan', phone_number: 2627283111 )
        visit "/libraries/#{libraries.id}"

        click_link "Edit #{libraries.name}"
        expect(current_path).to eq("/libraries/#{libraries.id}/edit")
      end

      it 'can edit the parent' do
        libraries = Library.create!(name: 'Delvan Public Library', city: 'Delavan', phone_number: 2627283111 )

        visit "/libraries/#{libraries.id}"
        expect(page).to have_link("Edit Delvan Public Library")
        click_link "Edit Delvan Public Library"

        fill_in 'name', with: "Delavan"
        click_button "Update Library"

        expect(current_path).to eq("/libraries")
        expect(page).to have_content("Delavan")
      end
    end
  end
end