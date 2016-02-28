class AddClosingDateToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :closing_date, :date
  end
end
