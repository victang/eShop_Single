class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.integer :wrong_try
      t.boolean :acclock
      t.boolean :active

      t.timestamps
    end
  end
end
