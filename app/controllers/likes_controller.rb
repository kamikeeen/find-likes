class LikesController < ApplicationController
  before_action :set_like, only:[:show, :add]

  def index
    
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)

    if @like.save
      @like.users << current_user
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def add
    unless current_user.likes.ids.include?(@like.id)
      @like.users << current_user
      redirect_to like_path(@like.id)
    else
      @user_like = UserLike.find_by(user_id: current_user.id, like_id: @like.id)
      UserLike.destroy(@user_like.id)
      redirect_to like_path(@like.id)
    end
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:name, :ancestry, :genre_id)
  end
end
