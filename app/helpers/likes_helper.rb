module LikesHelper
  def liked?(current_user, like)
    'yet' unless current_user.likes.include?(like)
  end
end
