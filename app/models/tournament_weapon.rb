class TournamentWeapon < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :weapon
end
