class LikesController < ApplicationController
  before_action :set_like, only:[:show, :add]

  def index
    @sorted_likes = UserLike.sort_desc_order
    sorted_likes_ids = []

    rand_genre_id = rand(1..8)
    @genre = Genre.find(rand_genre_id)
    @sorted_genre_likes = UserLike.where(like_id: @genre.likes.ids).sort_desc_order
    sorted_genre_likes_ids = []

    @sorted_likes.zip(@sorted_genre_likes)[0, 5].each do |sorted_likes, sorted_genre_likes|
      sorted_likes_ids << sorted_likes.first
      sorted_genre_likes_ids << sorted_genre_likes.first
    end
    
    @likes_ranking5 = Like.search_sort_with_ids(sorted_likes_ids)
    @genre_likes_ranking5 = Like.search_sort_with_ids(sorted_genre_likes_ids)
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
    @users = User.search_sort_with_ids(user_ids)
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:name, :ancestry, :genre_id)
  end

end
