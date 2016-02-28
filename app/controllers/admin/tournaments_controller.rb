class Admin::TournamentsController < Admin::ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.create(tournament_params)
    if @tournament.save
      redirect_to admin_tournaments_path, notice: "The tournament has been created"
    else
      render "new", alert: "The tournament has not been created"
    end
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(tournament_params)
      redirect_to admin_tournaments_path(@tournament), notice: "Tournament has been updated"
    else
      render "edit", alert: "Tournament has not been updated"
    end
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    redirect_to admin_tournaments_path, notice: "Tournament has been deleted"
  end

  private

  def tournament_params
    params.require(:tournament).permit(:title, :start_date, :end_date, :closing_date, :country_id, :location, :venue, :category_id, :link, :organization_id, :weapon_ids => [])
  end

end
