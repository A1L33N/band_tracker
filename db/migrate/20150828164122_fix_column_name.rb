class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :bands, :band, :name
  end
end
