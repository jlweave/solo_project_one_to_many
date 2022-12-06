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

  def edit
   @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update(library_params)
    redirect_to '/libraries'
  end
  private
  def library_params
    params.permit(:name, :city, :phone_number, :computer_lab)
  end
end