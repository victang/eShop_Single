class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name
      t.text :descr
      t.string :image
      t.date :date_from
      t.date :date_to
      t.boolean :active

      t.timestamps
    end
  end
end
