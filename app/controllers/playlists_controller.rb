class PlaylistsController < ApplicationController

  def index
    @songs = Playlist.all
  end

  def show
    @user = User.find_by_permalink(params[:id])
  end

  def create


    @foo = params[:user_ids]

    @foo.each do |userid|
     @song = Playlist.create(song_uri: params[:playlist][:song_uri], user_id: userid)
    end

    redirect_to '/search_results'
  end

  def destroy
    @song = Playlist.find(params[:id])
    @song.destroy
    redirect_to '/playlists'
  end

  private

  def playlist_params
    params.require(:playlist).permit(:song_uri, :user_id)
  end

end
