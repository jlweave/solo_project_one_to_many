# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
require 'rails_helper'

RSpec.describe 'Libraries books index' do
  before :each do
    @library1 = Library.create!(city: "Denver", name:"Denver Public Library", computer_lab: true, phone_number: 7208651111)
    @library2 = Library.create!(city: "Colorado Spring", name:"Colorado Springs Public Library", computer_lab: false, phone_number: 7195316333)
    @book1 = @library1.books.create!(name: "Fairy Tale", IBN: 9781668002179, available: true)
    @book2 = @library1.books.create!(name: "The Boy From Biloxi", IBN: 9780385548922, available: false)
    @book3 = @library2.books.create!(name: "Lessons in Chemisty", IBN: 9780385549400, available: true)
    @book4 = @library2.books.create!(name: "The Light We Carry: Overcoming in Uncertain Times", IBN: 9780593237465, available: false)
    @book5 = @library2.books.create!(name: "If He Had Been with Me", IBN: 9781728205489, available: true)

  end
  it 'shows all of the books for the Library' do
    visit "/libraries/#{@library1.id}/books"

    expect(page).to have_content(@book1.id)
    expect(page).to have_content(@book1.name)
    expect(page).to have_content(@book1.IBN)
    expect(page).to have_content(@book1.available)
    expect(page).to have_content(@book1.library_id)

    expect(page).to have_content(@book2.id)
    expect(page).to have_content(@book2.name)
    expect(page).to have_content(@book2.IBN)
    expect(page).to have_content(@book2.available)
    expect(page).to have_content(@book2.library_id)

    expect(page).to_not have_content(@book3.name)
    expect(page).to_not have_content(@book4.name)
    expect(page).to_not have_content(@book5.name)
  end

  it 'does it have a link to create a new book' do
    visit "/libraries/#{@library1.id}/books"

    expect(page).to have_link("Create Book")  
  end

  it "create a new book with it's attributes" do
    visit "/libraries/#{@library1.id}/books"

    click_link("Create Book")

    expect(current_path).to eq("/libraries/#{@library1.id}/books/new")

    fill_in('name', with: "Mary Poppins")
    fill_in('IBN', with: "9780385297922")
    choose('available', with: true)
    click_button("Submit Create New Book")

    expect(current_path).to eq("/libraries/#{@library1.id}/books")

    poppins = Book.last 
    expect(page).to have_content(poppins.name)
    expect(page).to have_content(poppins.IBN)
    expect(page).to have_content(poppins.available)
  end

 
end