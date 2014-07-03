class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user, index: true
      t.integer :follower_id

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, [:user_id, :follower_id], unique: true
  end
end
