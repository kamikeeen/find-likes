class LikesController < ApplicationController
  before_action :set_like, only:[:show, :add]

  def index
    sort_likes = UserLike.group(:like_id).count.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }
    sort_likes_ids = []

    rand_genre_id = rand(1..8)
    @genre = Genre.find(rand_genre_id)
    sort_genre_likes = UserLike.where(like_id: Like.where(genre_id: rand_genre_id).ids).group(:like_id).count.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }
    sort_genre_likes_ids = []

    5.times do |n|
      sort_likes_ids << sort_likes[n][0]
      sort_genre_likes_ids << sort_genre_likes[n][0]
    end
    @sort_likes5 = Like.where(id: sort_likes_ids).order(['field(id, ?)', sort_likes_ids])
    @sort_genre_likes5 = Like.where(id: sort_genre_likes_ids).order(['field(id, ?)', sort_genre_likes_ids])
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
    user_ids = []
    @same_like_counts = []
    @like.sorted_same_likes_users(current_user).each do |user|
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
