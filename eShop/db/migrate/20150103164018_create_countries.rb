class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :areacode
      t.string :countryid
      t.string :countrtname

      t.timestamps
    end
  end
end
