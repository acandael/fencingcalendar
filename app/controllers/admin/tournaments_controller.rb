class Admin::TournamentsController < Admin::ApplicationController

  def index
    @tournaments = Tournament.all
  end

end
