class Api::UsersController < ApplicationController
  protect_from_forgery except: [:add_like, :delete_like]
  before_action :set_like

  def add_like
    @like.users << current_user
    render json: { status: 200 }
  end

  def delete_like
    @like.users.delete(current_user)
    render json: { status: 200 }
  end

  private
  def set_like
    @like = Like.find(params[:id])
  end
end