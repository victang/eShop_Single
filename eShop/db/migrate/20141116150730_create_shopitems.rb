class CreateShopitems < ActiveRecord::Migration
  def change
    create_table :shopitems do |t|
      t.string :code_name
      t.string :short_name
      t.string :long_name
      t.integer :stock
      t.float :price
      t.integer :sales
      t.string :image
      t.text :descr
      t.boolean :active
      
      t.timestamps
    end
  end
end
