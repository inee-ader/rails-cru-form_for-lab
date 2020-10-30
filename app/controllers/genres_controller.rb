class GenresController < ApplicationController
    
    before_action :find_genre, only: [:update, :show, :edit]

    def index 
        @genres = Genre.all
    end
    
    def new 
        @genre = Genre.new
    end

    def create 
        @genre = Genre.create(safety)
        redirect_to genre_path(@genre)
    end

    def update 
        @genre.update(safety)
        redirect_to genre_path(@genre)
    end 

    def show 
        #find_genre
    end

    def edit
        #show the edit form page
    end

    private

    def safety 
        params.require(:genre).permit(:name)
    end

    def find_genre
        @genre = Genre.find(params[:id])
    end

end
