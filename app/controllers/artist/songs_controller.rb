class Artist::SongsController < ApplicationController
  before_action :set_artist, only: [:index, :new, :create]

  def index
    @songs = @artist.songs.all
  end

  def new
    @song = @artist.songs.new

  end

  def create
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
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def song_params
      params.require(:song).permit(:title)
    end
end
