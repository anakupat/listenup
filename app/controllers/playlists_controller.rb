class PlaylistsController < ApplicationController

  def show
    @user = User.find_by_permalink(params[:id])
    @params_id = @user.id
    @songs = Song.where(user_id:  @params_id)
    @friends = Friendship.where(user_id: @params_id)
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to '/playlists'
  end
end
