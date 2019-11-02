class AddReasonToUserLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :user_likes, :reason, :text
  end
end
