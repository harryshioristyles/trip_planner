class Admin::TripsController < ApplicationController

  before_action :authenticate_admin!

  def index
  	  @user = User.find(params[:user_id])
      all_trips = Trip.where(user_id: @user, checking_finish: 1)

      page_no = params[:id].to_i
      @trips = all_trips[page_no*10..page_no*10+9]
      @previous_page = page_no - 1
    if all_trips.last == @trips.last
      @next_page = 0
    else
      @next_page = page_no + 1
    end
  end

  def trip_edit
      @trip = Trip.find(params[:id])
      @days = List.where(trip_id: @trip).maximum(:day_index)
  end

  def trip_update
      trip = Trip.find(params[:id])
      trip.update(trip_params) ? flash[:notice] = "Successfully updated." : flash[:notice] = "Update error!!"
      redirect_to admin_edit_trip_path(trip)
  end

  def trip_destroy
      trip = Trip.find(params[:id])
      trip.destroy ? flash[:notice] = 'Successfully destroyed.' : flash[:notice] = 'Destroy error!!'
      redirect_to admin_trip_path(trip.user_id)
  end

  def list_edit
      @list = List.find(params[:id])
      @trip = Trip.find(@list.trip_id)
      @days = List.where(trip_id: @trip).maximum(:day_index)
  end

  def list_update
      list = List.find(params[:id])
      list.update(list_params) ? flash[:notice] = "successfully updated." : flash[:notice] = "update error!!"
      redirect_to admin_edit_list_path(list)
  end

  def list_destroy
      list = List.find(params[:id])
      list.destroy ? flash[:notice] = 'successfully destroyed.' : flash[:notice] = 'destroy error!!'
      redirect_to admin_edit_trip_path(list.trip_id)
  end

private

  def trip_params
      params.require(:trip).permit(:trip_title, :trip_details, :trip_image)
  end

  def list_params
      params.require(:list).permit(:list_title, :list_details, :day_index, :date, :begin, :end, :city_id, :activity_id, :trip_id)
  end

end
