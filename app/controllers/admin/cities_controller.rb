class Admin::CitiesController < ApplicationController
  def index
          @country = Country.new
          @city = @country.cities.build

          @countries = Country.all.order(:area)
  end

  def create
          country = Country.new(country_params)
    if country.save
          flash[:notice] = "created successfully!"
          redirect_to admin_cities_path
    else
          flash[:notice] = "Error"
          render action: :index
    end
  end

  def edit
          @country = Country.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

    def country_params
        params.require(:country).permit(:country_name,:area, cities_attributes: [:id, :city_name, :country_id, :_destroy])
    end

end
