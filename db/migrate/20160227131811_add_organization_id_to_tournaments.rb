class AddOrganizationIdToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :organization_id, :integer
  end
end
