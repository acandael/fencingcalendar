class Tournament < ActiveRecord::Base

  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => %w[
                sorted_by
                search_query
                with_country_id
                with_category_id
                with_any_weapon_ids
              ]

  # default for will_paginate
  self.per_page = 10

  belongs_to :country
  belongs_to :category
  belongs_to :organization

  has_many :tournament_weapons, dependent: :delete_all
  has_many :weapons, :through => :tournament_weapons


  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 2
    where(
      terms.map {
        or_clauses = [
          "LOWER(tournaments.title) LIKE ?",
          "LOWER(tournaments.location) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("tournaments.created_at #{ direction }")
    when /^title_/
      order("LOWER(tournaments.title) #{ direction }")
    when /^country_name_/
      order("LOWER(countries.name) #{ direction }").includes(:country).references(:country)
    when /^location_/
      order("LOWER(tournaments.location) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  scope :with_country_id, lambda { |country_ids|
    where(:country_id => [*country_ids])
  }

  scope :with_category_id, lambda { |category_ids|
    where(:category_id => [*category_ids])
  }

  scope :with_any_weapon_ids, lambda{ |weapon_ids|
    # get a reference to the join table
    tournament_weapons = TournamentWeapon.arel_table
    # get a reference to the filtered table
    tournaments = Tournament.arel_table
    # let AREL generate a complex SQL query
    where(
      TournamentWeapon.where(tournament_weapons[:tournament_id].eq(tournaments[:id])).where(tournament_weapons[:weapon_id].in([*weapon_ids].map(&:to_i))).exists
    )
  }

  delegate :name, :to => :country, :prefix => true
  

  def self.options_for_sorted_by
    [
      ['Title (a-z)', 'title_asc'],
      ['Country (a-z)', 'country_name_asc']
    ]
  end

end
