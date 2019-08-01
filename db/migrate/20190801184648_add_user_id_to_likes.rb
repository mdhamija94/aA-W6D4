class AddUserIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :user_id, :integer, null: false
    add_index :likes, :user_id
    add_index :likes, [:user_id, :like_id, :like_type], unique: true
  end
end
