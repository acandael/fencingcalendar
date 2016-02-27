class Country < ActiveRecord::Base
  has_many :countries

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end

end
