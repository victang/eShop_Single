class CreatePromotionTags < ActiveRecord::Migration
  def change
    create_table :promotion_tags do |t|
      t.integer :promotion_id
      t.string :tag

      t.timestamps
    end
  end
end
