class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @user = User.find_by_permalink(params[:id])
    @params_id = @user.id
    @songs = Song.where(user_id:  @params_id)
    @friends = Friendship.where(user_id: @params_id)
  end

  def create
    # binding.pry
    @user_ids = params[:user_ids]
    @artist = params[:song][:name]
    @user_ids.each do |userid|
      @song = Song.create(song_uri: params[:song][:song_uri],
       song_name: params[:song][:song_name], user_id: userid, added_by: current_user.username)
    end

    redirect_to '/search'
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to "/playlists/#{current_user.permalink}"
  end

  private

  def song_params
    params.require(:song).permit(:song_uri, :user_id, :song_name, :added_by)
  end
end
