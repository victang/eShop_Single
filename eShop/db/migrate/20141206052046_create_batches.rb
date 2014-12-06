class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :code
      t.integer :status
      t.text :remark
      t.boolean :active
      t.integer :user_id
      t.string :email
      t.string :fullname
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :address5
      t.string :address6
      t.string :country
      t.string :city
      t.string :phone
      t.text :user_remark

      t.timestamps
    end
  end
end
