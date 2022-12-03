class LibraryBooksController < ApplicationController
  def index
    @library = Library.find(params[:id])
    @l_books = @library.books
  end
end