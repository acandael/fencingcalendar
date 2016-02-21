class AddCreateAtToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :created_at, :datetime
    add_column :tournaments, :updated_at, :datetime
  end
end
