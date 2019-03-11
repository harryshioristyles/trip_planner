class TripsController < ApplicationController

  def world; end
  def area_asia; end
  def area_middle_east; end
  def area_europe; end
  def area_africa; end
  def area_north_america; end
  def area_south_america; end
  def area_oceania; end

  def list
        @list = List.find(params[:id])
        @trip = Trip.find(@list.trip_date.trip_id)
  end

  def list_create
        city = params[:city_id]

        @trip = params[:trip_id] #from view_list
        if  @trip == nil #from view_area
            @trip = Trip.where(user_id: current_user.id).last
        end

        @date = params[:trip_date_id] #from view_list
        if  @date == nil #new list
            @date = TripDate.new(day_index: 1, trip_id: @trip.id)
            @date.save!
        end

        list = List.new(list_index: 1, activity_id: 1, trip_date_id: @date.id)
        list.save!
        redirect_to list_path(list)
  end

  def list_update
        list = List.find(params[:id])
        list.update(list_params)
        redirect_to list_path(list)
  end

  def date_create
        trip = params[:trip_id]
        date = TripDate.new(day_index: 1, trip_id: trip.id)
        date.save!
        redirect_to world_path
  end

  def date_update
  end

  def index
  end

  def create
        trip = Trip.new(check_finish: 0, user_id: current_user.id)
        trip.save!
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

    private

    def list_params
      params.require(:list).permit(:list_title, :list_subtitle, :list_index, :begin, :end, :activity_id, :trip_date_id)
    end

end
