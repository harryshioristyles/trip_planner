class TripsController < ApplicationController

  def world; end
  def area_asia; end
  def area_middle_east; end
  def area_europe; end
  def area_africa; end
  def area_north_america; end
  def area_south_america; end
  def area_oceania; end

  def index
  end

  def create
        redirect_to world_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
