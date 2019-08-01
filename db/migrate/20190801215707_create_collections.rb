class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_items do |t|
      t.string :collection_name, null: false
      t.integer :owner_id, null: false
      t.integer :artwork_id, null: false

      t.timestamps
    end

    add_index :collection_items, :owner_id
    add_index :collection_items, :artwork_id
  end
end
