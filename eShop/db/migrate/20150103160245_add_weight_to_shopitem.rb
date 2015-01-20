class AddWeightToShopitem < ActiveRecord::Migration
  def change
    add_column :shopitems, :weight, :float
  end
end
