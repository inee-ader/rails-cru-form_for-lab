class SongsController < ApplicationController

    before_action :find_song, only: [:update, :show, :edit]
    
    def index 
        @songs = Song.all 
    end
    
    def new 
        @song = Song.new
        #shows the new form page
    end

    def create 
        @song = Song.create(safety)
        redirect_to song_path(@song)
    end

    def update 
        @song.update(safety)
        redirect_to song_path(@song)
    end

    def show 
        @genre = @song.genre_id
        @artist = @song.artist_id
    end

    def edit
        #shows the edit form page
    end

    private 

    def find_song
        @song = Song.find(params[:id])
    end

    def safety
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
