class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :handle
      t.string :password_digest
      t.string :validation_token
      t.string :validation_state

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :handle, unique: true
  end
end
