class AddIndexToColumns < ActiveRecord::Migration[6.0]
  def change
    add_index :user_likes, [:user_id, :like_id], unique: true
    add_index :likes, [:name, :genre_id], unique: true
  end
end
