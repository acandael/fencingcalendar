class Admin::OrganizationsController < Admin::ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def new
    @organization = Organization.new
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.create(organization_params)
    if @organization.save
      redirect_to admin_organizations_path, notice: "The organization has been created"
    else
      render "new", alert: "The organization has not been created"
    end
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      redirect_to admin_organizations_path, notice: "Organization has been updated"
    else
      render "edit", alert: "Organization has not been updated"
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to admin_organizations_path, notice: "The organizations has been deleted"
  end


  private

  def organization_params
    params.require(:organization).permit(:name, :link)
  end

end
