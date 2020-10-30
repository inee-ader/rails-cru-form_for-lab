class ArtistsController < ApplicationController

    before_action :find_artist, only: [:update, :show, :edit]
    
    def new 
        #shows new form page
        @artist = Artist.new
    end

    def create 
        @artist = Artist.create(safety)
        redirect_to artist_path(@artist)
    end

    def update 
        @artist.update(safety)
        redirect_to artist_path(@artist)
    end

    def show 
        #find_artist
    end

    def edit
        #shows edit form page
    end

    private

    def safety
        params.require(:artist).permit(:name, :bio)
    end

    def find_artist
        @artist = Artist.find(params[:id])
    end

end
