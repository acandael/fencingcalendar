class Organization < ActiveRecord::Base
  has_many :tournaments, :dependent => :nullify
end
