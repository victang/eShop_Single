class CreateShopitemImages < ActiveRecord::Migration
  def change
    create_table :shopitem_images do |t|
      t.integer :shopitem_id
      t.string :image
      t.text :descr

      t.timestamps
    end
  end
end
