class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.string      :name
      t.string      :ancestry
      t.timestamps
    end
  end
end
