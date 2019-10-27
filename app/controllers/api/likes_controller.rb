class Api::LikesController < ApplicationController
  layout false
  def search
    @likes = Like.where("name LIKE(?)", "%#{params[:keyword]}%")
  end

  def select_genre
  end
end
