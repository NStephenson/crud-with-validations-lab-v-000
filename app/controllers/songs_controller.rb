class SongsController < ApplicationController
  before_action :current_song, only: [:edit, :show, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    
  end

  def create
    @song = Song.new(post_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    @song.update(post_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end 
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def current_song
    @song = Song.find(params[:id])
  end

  def post_params
    params.require(:song).permit(:title, :released, :release_year, :genre, :artist)
  end
end
