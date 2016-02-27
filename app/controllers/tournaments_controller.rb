class TournamentsController < ApplicationController

  def index
    @filterrific = initialize_filterrific(
      Tournament,
      params[:filterrific],
      :select_options => {
        sorted_by: Tournament.options_for_sorted_by,
        with_country_id: Country.options_for_select,
        with_category_id: Category.options_for_select,
        with_any_weapon_ids: Weapon.options_for_select
      }
    ) or return
    @tournaments = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

end
