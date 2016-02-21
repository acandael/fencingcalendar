class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :title
      t.date :start_date
      t.string :location
      t.integer :country_id
      t.string :link
    end
  end
end
