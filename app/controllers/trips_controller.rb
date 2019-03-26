class TripsController < ApplicationController

  def search
      all_trips = Trip.search(params[:search]).where(checking_finish: 1).order(updated_at: :desc)

      page_no = params[:id].to_i
      @trips = all_trips[page_no*10..page_no*10+9]
      @next_page = page_no + 1
      @previous_page = page_no - 1
  end

  def favorite_trips
      all_trips = FavoriteTrip.where(user_id: params[:user_id], checking_finish: 1).order(created_at: :desc).map{|a| a.trip}

      page_no = params[:id].to_i
      @trips = all_trips[page_no*10..page_no*10+9]
      @next_page = page_no + 1
      @previous_page = page_no - 1
  end

  def new
      @trip = Trip.new
  end

  def create
      trip = Trip.new(trip_params)
      trip.checking_finish = 0
      trip.user_id = current_user.id
      trip.save!
      redirect_to new_list_path(trip_id: trip)
  end

  def show
      @trip = Trip.find(params[:id])
      @user = User.find(@trip.user_id)
  end

  def result
      @trip = Trip.find(params[:id])
      @trip.update(checking_finish: 1)
      @days = List.where(trip_id: @trip).maximum(:day_index)
  end

  def edit
      @trip = Trip.find(params[:id])
      @days = List.where(trip_id: @trip).maximum(:day_index)
  end

  def update
      trip = Trip.find(params[:id])
    if
      trip.update(trip_params)
      redirect_to new_list_path(trip_id: trip.id)
      flash[:notice] = "successfully updated."
    else
      redirect_to edit_trip_path(trip.id)
      flash[:notice] = "update error!!"
    end
  end

  def destroy
      trip = Trip.find(params[:id])
    if
      trip.destroy
      flash[:notice] = 'successfully destroyed.'
    else
      flash[:notice] = 'destroy error!!'
    end
      redirect_to trips_path
  end

private

  def trip_params
      params.require(:trip).permit(:trip_title, :trip_details, :trip_image)
  end

end
