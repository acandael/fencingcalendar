class CreateTournamentWeapons < ActiveRecord::Migration
  def change
    create_table :tournament_weapons do |t|
      t.references :tournament, index: true, foreign_key: true
      t.references :weapon, index: true, foreign_key: true
    end
  end
end
