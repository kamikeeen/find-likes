class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    same_likes = @user.likes & current_user.likes
    @count = same_likes.length
  end
end
