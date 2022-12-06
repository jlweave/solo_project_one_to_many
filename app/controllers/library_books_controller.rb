class LibraryBooksController < ApplicationController
  def index
    @library = Library.find(params[:id])
    @l_books = @library.books
  end

  def new
    @library = Library.find(params[:id])
  end

  def create
    @library = Library.find(params[:id])
    @l_books = @library.books.create(name: params[:name], IBN: params[:IBN], available: params[:available])
    redirect_to "/libraries/#{@library.id}/books"
  end
end