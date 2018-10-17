class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show

  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render 'edit'
    end

  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :artist_name, :release_year, :genre)
  end

  def find_song
    @song = Song.find_by(id: params[:id])
  end

end
