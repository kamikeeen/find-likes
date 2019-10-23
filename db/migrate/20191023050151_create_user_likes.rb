class CreateUserLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :like, foreign_key: true, null: false
      t.timestamps
    end
  end
end
