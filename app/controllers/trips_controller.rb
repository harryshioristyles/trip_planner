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
        trip = Trip.new(check_finish: 0, user_id: current_user.id)
        trip.save!
        redirect_to world_path
  end

  def list
  end

  def list_create
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
