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
    user_like_ids = current_user.likes.ids
    same_likes = {}
    @like.users.each do |follow_user|
      same_likes_array = follow_user.likes.ids & user_like_ids
      same_likes[follow_user.id] = same_likes_array.length
    end
    same_likes = same_likes.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }
    user_ids = []
    @same_like_counts = []
    same_likes.each do |user|
      user_ids << user[0]
      @same_like_counts << user[1]
    end
    @users = User.where(id: user_ids).order(['field(id, ?)', user_ids])
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
