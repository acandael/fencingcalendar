class AddVenueToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :venue, :text
  end
end
