module UsersHelper
  def followed?(current_user, user)
    'yet' unless current_user.followings.include?(user)
  end

end
