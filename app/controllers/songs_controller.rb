class SongsController < ApplicationController
  before_action :set_song, only: [:edit, :show, :delete, :update]


  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def edit
    render :edit
  end

  def update
    byebug
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    byebug
    @song.destroy
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:released, :release_year, :artist_name, :genre, :title)
  end

end
