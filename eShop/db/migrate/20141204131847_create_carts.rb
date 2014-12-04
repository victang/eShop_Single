class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :batch_id
      t.integer :shopitem_id
      t.integer :shopitem_amount
      t.float :pay_amount
      t.boolean :selected

      t.timestamps
    end
  end
end
