class PlaylistsController < ApplicationController

def index
  @songs = Playlist.all
end

def show
  @user = User.find(params[:id])
end

def create
  @song = Playlist.new(playlist_params)
    if @song.save
      redirect_to '/playlists'
      flash.now[:notice] = "Song added to playlist"
    else
      flash.now[:notice] = "Not saved!"
      redirect_to '/search_results'
    end
end

def destroy
    @song = Playlist.find(params[:id])
    @song.destroy
    redirect_to '/playlists'
  end

  private

  def playlist_params
    params.require(:playlist).permit(:song_uri)
  end

end
