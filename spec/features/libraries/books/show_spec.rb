require 'rails_helper'

RSpec.describe 'Libraries books show page' do
  before :each do
    @library1 = Library.create!(city: "Denver", name:"Denver Public Library", computer_lab: true, phone_number: 7208651111)
    @library2 = Library.create!(city: "Colorado Spring", name:"Colorado Springs Public Library", computer_lab: false, phone_number: 7195316333)
    @book1 = @library1.books.create!(name: "Fairy Tale", IBN: 9781668002179, available: true)
    @book2 = @library1.books.create!(name: "The Boy From Biloxi", IBN: 9780385548922, available: false)
    @book3 = @library2.books.create!(name: "Lessons in Chemisty", IBN: 9780385549400, available: true)
    @book4 = @library2.books.create!(name: "The Light We Carry: Overcoming in Uncertain Times", IBN: 9780593237465, available: false)
    @book5 = @library2.books.create!(name: "If He Had Been with Me", IBN: 9781728205489, available: true)
  end


end