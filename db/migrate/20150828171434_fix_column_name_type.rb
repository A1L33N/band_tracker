class FixColumnNameType < ActiveRecord::Migration
  def change
    rename_column :bands, :type, :category
  end
end
