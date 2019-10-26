class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true, null: false
      t.references :follows, foreign_key: { to_table: :users}, null: false
      t.timestamps
    end
    add_index :relationships, [:user_id, :follows_id], unique: true
  end
end
