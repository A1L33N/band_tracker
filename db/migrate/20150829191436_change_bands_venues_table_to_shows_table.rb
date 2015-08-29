class ChangeBandsVenuesTableToShowsTable < ActiveRecord::Migration
  def change
    rename_table :bands_venues, :shows

  end
end
