class TripsController < ApplicationController
  def index
  end

  def new
    @trip = Trip.new
  end

  def create
        trip = Trip.new(trip_params)
        trip.checking_finish = 0
        trip.user_id = current_user.id
        trip.save!
        redirect_to new_list_path
  end



  def show
  end

  def edit
        @trip = Trip.find(params[:id])
  end

  def update
        trip = Trip.find(params[:id])
      if
        trip.update(trip_params)
        redirect_to new_list_path
        flash[:notice] = "successfully updated."
      else
        redirect_to edit_trip_path(trip.id)
        flash[:notice] = "update error!!"
      end
  end

  def destroy
  end

private

  def trip_params
        params.require(:trip).permit(:trip_title, :trip_details)
  end

end
