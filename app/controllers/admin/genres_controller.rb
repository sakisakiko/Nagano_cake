class Admin::GenresController < ApplicationController
  
  
  def create 
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to edit_admin_genre_path(genre_params[:id])
  end
  
  def index
    @genre=Genre.new
    @genres=Genre.all
  end

  def edit
    @genre=Genre.find(params[:id])
  end
  
  def update 
    @genre=Genre.find(paramd[:id])
    @genre.update(genre.params)
    redirect_to admin_genres_path
  end
  


end
