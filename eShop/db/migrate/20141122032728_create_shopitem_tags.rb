class CreateShopitemTags < ActiveRecord::Migration
  def change
    create_table :shopitem_tags do |t|
      t.integer :shopitem_id
      t.string :tag

      t.timestamps
    end
  end
end
