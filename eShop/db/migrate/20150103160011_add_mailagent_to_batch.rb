class AddMailagentToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :mailagent, :string
  end
end
