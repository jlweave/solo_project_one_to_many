class AddBooksToLibraries < ActiveRecord::Migration[5.2]
  def change
    add_reference :libraries, :book, foreign_key: true
  end
end
