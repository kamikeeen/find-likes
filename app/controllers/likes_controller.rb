class LikesController < ApplicationController

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

  private
  def like_params
    params.require(:like).permit(:name, :ancestry, :genre_id)
  end
end
