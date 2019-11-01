class Api::UsersController < ApplicationController
  before_action :set_like, only: [:add_like, :delete_like]
  before_action :set_user, only: [:follow, :unfollow]
  
  def add_like
    @like.users << current_user
    render json: { status: 200 }
  end

  def delete_like
    @like.users.delete(current_user)
    render json: { status: 200 }
  end

  def follow
    current_user.followings << @user
    render json: { status: 200 }
  end

  def unfollow
    current_user.followings.delete(@user)
    render json: { status: 200 }
  end

  private
  def set_like
    @like = Like.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end