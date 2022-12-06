class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end
  
  def show
     @library = Library.find(params[:id])
  end

  def new
  end

  def create
    library = Library.create(name: params[:name], city: params[:city], phone_number: params[:phone_number])
    redirect_to "/libraries/#{library.id}"
  end
end