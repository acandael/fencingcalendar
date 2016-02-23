class Weapon < ActiveRecord::Base
  has_many :tournament_weapons
  has_many :tournaments, :through => :tournament_weapons

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
end
