class AddDateToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :end_date, :date
  end
end
