class AddCategoryToTournaments < ActiveRecord::Migration
  def change
    add_reference :tournaments, :category, index: true, foreign_key: true
  end
end
