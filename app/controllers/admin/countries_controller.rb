class Admin::CountriesController < Admin::ApplicationController

  def index
    @countries = Country.all.order(name: :asc)
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def edit
    @country = Country.find(params[:id])
  end

  def create
    @country = Country.create(country_params)
    if @country.save
      redirect_to admin_countries_path, notice: "The country has been added"
    else
      render "new", alert: "The country has not been added"
    end
  end

  def update
    @country = Country.find(params[:id])
    if @country.update(country_params)
      redirect_to admin_countries_path, notice: "Country has been updated"
    else
      render "edit", alert: "Country has not been updated"
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    redirect_to admin_countries_path, notice: "Country has been deleted"
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end
