class AddGenreToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :genre_id, :integer, null: false
  end
end
