class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :countries, :countrtname, :countryname
  end
end
