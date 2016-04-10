class Artist::SongsController < ApplicationController

  def index
    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
    end
    @songs = Song.all
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to artist_songs_path(song.artist_id)

  end
  private
    def song_params
      params.require(:song).permit(:title)
    end
end
