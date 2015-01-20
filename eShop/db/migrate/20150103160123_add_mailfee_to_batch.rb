class AddMailfeeToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :mailfee, :float
  end
end
