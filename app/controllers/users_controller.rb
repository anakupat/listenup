class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # def show
  #   @user = User.find_by(permalink: params[:id])
  #   @friendships = @user.all_friendships


  #   # binding.pry
  # end

  def show
    @user = User.find_by_permalink(params[:id])
    @params_id = @user.id
    @songs = Song.where(user_id:  @params_id)
    @friendships = @user.all_friendships
  end
end
