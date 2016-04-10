class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update]
  before_action :set_playlist_songs, only: [:new, :create, :edit]
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to @playlist
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist
    else
      render :edit
    end
  end

  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def set_playlist_songs
      @playlist_songs = PlaylistSong.where(playlist_id: params[:id]).pluck(:song_id)
    end

    def playlist_params
      params.require(:playlist).permit(:name, song_ids: [])
    end
end
