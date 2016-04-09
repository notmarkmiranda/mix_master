class SongsController < ApplicationController

  def index
    # @artist = Artist.find(params[:artist_id])
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
    @artist = @song.artist
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to songs_path
  end

  private
    def song_params
      params.require(:song).permit(:title)
    end
end
