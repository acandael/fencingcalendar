class AddTimestampsToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :created_at, :datetime
    add_column :countries, :updated_at, :datetime
  end
end
