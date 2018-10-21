class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(strong_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      flash[:error] = @song.errors.full_messages
      render :new #// they want me to render instead
    end
  end

  def show
  end

  def edit
  end

  def update
    @song.update(strong_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      flash[:error] = @song.errors.full_messages
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])

    @song.destroy
    redirect_to songs_url
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def strong_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
