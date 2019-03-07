class Admin::CitiesController < ApplicationController
  def index
        @country = Country.new
        @city = @country.cities.build

  end

  def create
        country = Country.new(country_params)
    if
        flash[:notice] = "created successfully!"
        redirect_to admin_cities_path
    else
        @product = Product.new
        flash[:notice] = "Error"
        redirect_to admin_cities_path
    end
  end

  def edit
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
