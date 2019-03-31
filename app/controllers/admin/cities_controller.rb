class Admin::CitiesController < ApplicationController

  before_action :authenticate_admin!

  def index
      @country = Country.new
      @city = @country.cities.build

      @countries = Country.all.order(:area)
  end

  def create
      country = Country.new(country_params)
    if
      country.save!
      flash[:notice] = "created successfully!"
    else
      flash[:notice] = "Error"
    end
      redirect_to admin_cities_path
  end

  def edit
      @country = Country.find(params[:id])
      @countries = Country.all.order(:area)
  end

  def update
      country = Country.find(params[:id])
    if
      country.update(country_params)
      redirect_to admin_cities_path
      flash[:notice] = "successfully updated"
    else
      redirect_to edit_admin_city_path(country)
      flash[:notice] = 'update error!!'
    end
  end

  def destroy
      country = Country.find(params[:id])
    if
      country.destroy
      redirect_to admin_cities_path
      flash[:notice] = "successfully updated"
    else
      redirect_to edit_admin_city_path(country)
      flash[:notice] = 'update error!!'
    end
  end

  private

  def country_params
      params.require(:country).permit(:country_name,:area, cities_attributes: [:id, :city_name, :country_id, :_destroy])
  end

end
